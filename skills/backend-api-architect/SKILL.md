---
name: backend-api-architect
description: Senior enterprise backend API architecture, layered clean separation (HTTP Routes/Controllers -> Services/Use Cases -> Repositories/Persistence), strict runtime contract validation (Zod/Pydantic/Valibot), semantic exception handling, and database query optimization (preventing N+1 and enforcing atomic transactions).
when_to_use: "Whenever creating or refactoring backend endpoints, controllers, business services, database schemas, ORM queries, migrations, middleware, authentication, or external API integrations."
allowed-tools: Read, Write, Edit, Grep, Glob
effort: medium
version: 2.0.0
---

# Backend API Architect — Clean Layering, Runtime Validation & High-Performance Persistence (v2.0)

> "A great API is not just a collection of endpoints; it is a resilient, strictly typed contract between clients and data. Senior backend architecture guarantees separation of concerns, defensive runtime schema enforcement, semantic error hierarchies, and zero accidental database deadlocks or N+1 leaks."

---

## 🎯 Purpose & Scope

The **`backend-api-architect`** skill governs all server-side engineering, REST/GraphQL/tRPC route handlers, application services, domain models, database queries, and third-party integrations. It establishes non-negotiable architectural layers, runtime validation contracts, structured error responses, and database optimization practices.

---

## 🏛️ The 3-Layer Clean Architecture Protocol

Every backend feature must strictly isolate responsibilities across 3 distinct boundaries:

```
┌────────────────────────────────────────────────────────┐
│ 1. TRANSPORT & PRESENTATION LAYER                      │
│ (HTTP Routes, Controllers, Middleware, Deserializers)  │
└──────────────────────────┬─────────────────────────────┘
                           │ (passes validated DTOs)
┌──────────────────────────▼─────────────────────────────┐
│ 2. DOMAIN & APPLICATION SERVICE LAYER                  │
│ (Use Cases, Business Rules, Orchestration, Policies)   │
└──────────────────────────┬─────────────────────────────┘
                           │ (calls repository interfaces)
┌──────────────────────────▼─────────────────────────────┐
│ 3. INFRASTRUCTURE & PERSISTENCE LAYER                  │
│ (Database Repositories, ORMs, Cache, External SDKs)    │
└────────────────────────────────────────────────────────┘
```

### Layer Constraints:
1. **Routes/Controllers:** Zero business logic. They parse requests, validate input against schemas, invoke the appropriate Service/Use Case, and map domain results to HTTP status codes.
2. **Services/Use Cases:** Zero direct HTTP dependencies (never accept `req` or `res` objects). Pure business rules and transaction boundaries.
3. **Repositories/Data Access:** Zero business validation. Encapsulate raw SQL, Prisma, Drizzle, or TypeORM queries and return clean domain entities or DTOs.

---

## 🔒 Strict Runtime Input & Output Validation

Never trust client input or upstream third-party webhooks. Every single input (`body`, `query`, `params`, `headers`) MUST be parsed and validated with runtime schema libraries (Zod, Valibot, Pydantic, ArkType):

```typescript
import { z } from 'zod';

// Strict contract definition
export const CreateSubscriptionSchema = z.object({
  customerId: z.string().uuid(),
  planCode: z.enum(['MEI_ESSENCIAL', 'SIMPLES_PRO', 'GERENTE_VIRTUAL']),
  billingCycle: z.enum(['MONTHLY', 'ANNUAL']).default('MONTHLY'),
  addons: z.array(z.string()).default([]),
  phoneNumber: z.string().regex(/^\+55\d{10,11}$/, 'Invalid Brazilian phone number')
});

export type CreateSubscriptionDTO = z.infer<typeof CreateSubscriptionSchema>;
```

- **Output Sanitation:** Strip sensitive internal fields (e.g., `passwordHash`, internal tokens, salt) before serializing responses.

---

## 🚨 Semantic Exception Handling & Structured Error Responses

### The Rules of Error Handling:
1. **Forbidden:** Empty `catch (e) {}` blocks or generic `res.status(500).json({ error: "Something went wrong" })`.
2. **Forbidden:** Leaking internal database stack traces or SQL errors to client responses.
3. **Mandatory:** Structured error objects adhering to **RFC 7807 (Problem Details for HTTP APIs)**:

```json
{
  "type": "https://api.lstecnologia.com.br/errors/resource-not-found",
  "title": "Empresa Não Encontrada",
  "status": 404,
  "detail": "Nenhuma empresa foi localizada com o CNPJ informado.",
  "instance": "/v1/companies/00112233000199",
  "code": "COMPANY_NOT_FOUND",
  "timestamp": "2026-10-30T14:20:00Z"
}
```

#### HTTP Status Code Mapping:
- `200 OK`: Successful read or update.
- `201 Created`: Resource successfully created (with `Location` header when applicable).
- `204 No Content`: Successful deletion or action with no response body.
- `400 Bad Request`: Schema validation failure or malformed payload.
- `401 Unauthorized`: Missing or invalid authentication token.
- `403 Forbidden`: Authenticated user lacks permission for this specific resource.
- `404 Not Found`: Target resource does not exist.
- `409 Conflict`: Unique constraint violation (e.g., duplicate email, concurrent modification).
- `422 Unprocessable Entity`: Syntactically valid input violates domain business invariant.
- `429 Too Many Requests`: Rate limit exceeded.

---

## ⚡ High-Performance Database Access & Query Discipline

### 1. Zero N+1 Query Leaks
Never fetch related records inside a loop (`for` / `forEach` / `map`).
```typescript
// ❌ FORBIDDEN: N+1 query killer
const orders = await db.orders.findMany();
for (const order of orders) {
  order.customer = await db.customers.findUnique({ where: { id: order.customerId } });
}

// ✅ MANDATORY: Eager relational join or single batched query
const orders = await db.orders.findMany({
  include: { customer: true }
});
```

### 2. Atomic ACID Transactions for Critical State Changes
Operations involving multiple tables (e.g., creating an order + decrementing inventory + logging an audit trail) MUST be wrapped in a transactional block with automatic rollback on error:
```typescript
await db.$transaction(async (tx) => {
  const order = await tx.order.create({ data: orderData });
  await tx.inventory.decrement({ where: { itemId: orderData.itemId }, by: 1 });
  await tx.auditLog.create({ data: { action: 'ORDER_PLACED', orderId: order.id } });
});
```

### 3. Strict Pagination
All listing endpoints must enforce pagination by default (e.g., `limit` capped at 100, cursor-based or offset/limit). Never allow unbound `SELECT *` from collections that grow unbounded.

---

## 📋 Backend API Audit Checklist

Before releasing any backend code:
1. [ ] Architecture strictly segregated: Controller -> Service -> Repository.
2. [ ] All request bodies, queries, and params parsed with strict schema validation.
3. [ ] No empty try/catch blocks; all errors return structured JSON with RFC 7807 schema and semantic HTTP code.
4. [ ] Sensitive fields (`passwordHash`, private keys) filtered out from response objects.
5. [ ] No N+1 queries in loops; all multi-step state mutations wrapped in database transactions.
6. [ ] Proper indexes exist for queried foreign keys and filtered columns.
