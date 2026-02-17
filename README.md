# Student Management System

A full-stack student management application built with Python backend and vanilla JavaScript frontend for managing student records.

## 🏗️ Architecture Overview

The system follows a layered architecture with clear separation of concerns:
- **Frontend**: Single Page Application (SPA) in vanilla JavaScript
- **Backend**: Python HTTP Server with RESTful API
- **Database**: SQLite database for persistent storage
- **Core**: Middleware, routing, and utility modules

---

## 📊 Data Flow Diagrams

### Level 0 DFD (System Context Diagram)

```
User → [Student Management System] ↔ Database
```

**Description**: High-level view showing the system as a single entity interacting with users and a database.

```mermaid
graph LR
    User["👤 End User"]
    System["📦 Student Management System<br/>(API + Frontend)"]
    DB[("💾 Database<br/>SQLite")]
    
    User -->|Requests| System
    System -->|Responses| User
    System <-->|CRUD Operations| DB
    
    style System fill:#4A90E2,stroke:#2E5C8A,color:#fff
    style User fill:#50C878,stroke:#2D7A4A,color:#fff
    style DB fill:#FF6B6B,stroke:#A61E1E,color:#fff
```

---

### Level 1 DFD (High-Level Process Decomposition)

```
User → Frontend → API Server → Services → Database
         (UI)      (Router)    (Business)  (Storage)
```

**Description**: System broken down into main processes and data stores.

```mermaid
graph LR
    User["👤 User"]
    Frontend["🖥️ Frontend<br/>JavaScript SPA"]
    API["🔌 API Server<br/>HTTP Router"]
    Services["⚙️ Services Layer<br/>Business Logic"]
    DB[("💾 Database<br/>SQLite")]
    
    User -->|User Input| Frontend
    Frontend -->|HTTP Requests| API
    API -->|Process Request| Services
    Services -->|Query/Update| DB
    DB -->|Data| Services
    Services -->|Response| API
    API -->|JSON Response| Frontend
    Frontend -->|Display| User
    
    style Frontend fill:#9B59B6,stroke:#6C3A7C,color:#fff
    style API fill:#3498DB,stroke:#2C5282,color:#fff
    style Services fill:#2ECC71,stroke:#1E7E39,color:#fff
    style DB fill:#E74C3C,stroke:#A61E1E,color:#fff
    style User fill:#F39C12,stroke:#A67C0A,color:#fff
```

---

### Level 2 DFD (Detailed Process Decomposition)

**Description**: Detailed breakdown showing individual processes, data flows, and components.

```mermaid
graph TB
    subgraph Frontend["Frontend Layer"]
        DOM["DOM Manipulation<br/>& Rendering"]
        Router["View Router<br/>SPA Navigation"]
        StudentForm["Student Form<br/>Component"]
        StudentTable["Student Table<br/>Component"]
        StudentService["Student Service<br/>API Client"]
    end
    
    subgraph API["Backend API Layer"]
        StudentRouter["Student Router<br/>HTTP Handler"]
        Middleware["Middleware<br/>CORS & Headers"]
        GetHandler["GET Handler<br/>Fetch Students"]
        PostHandler["POST Handler<br/>Create Student"]
        UpdateHandler["PUT Handler<br/>Update Student"]
        DeleteHandler["DELETE Handler<br/>Delete Student"]
    end
    
    subgraph Services["Services Layer"]
        StudentService_Backend["Student Service<br/>Business Logic"]
    end
    
    subgraph Database["Database Layer"]
        DBConnection["DB Connection<br/>Manager"]
        DBQueries["Database Queries<br/>SQL Execution"]
    end
    
    subgraph DataStore["Data Store"]
        StudentDB[("Students Table<br/>SQLite")]
    end
    
    %% Frontend Flows
    Router -->|Navigate| DOM
    StudentForm -->|Input Data| StudentService
    StudentTable -->|Display Data| DOM
    StudentService -->|GET /api/students| StudentRouter
    StudentService -->|POST /api/students| StudentRouter
    StudentService -->|PUT /api/students/:id| StudentRouter
    StudentService -->|DELETE /api/students/:id| StudentRouter
    
    %% API Flows
    StudentRouter -->|Request| Middleware
    Middleware -->|Route to Handler| GetHandler
    Middleware -->|Route to Handler| PostHandler
    Middleware -->|Route to Handler| UpdateHandler
    Middleware -->|Route to Handler| DeleteHandler
    
    GetHandler -->|Call| StudentService_Backend
    PostHandler -->|Call| StudentService_Backend
    UpdateHandler -->|Call| StudentService_Backend
    DeleteHandler -->|Call| StudentService_Backend
    
    %% Services to Database Flows
    StudentService_Backend -->|Execute Query| DBQueries
    DBQueries -->|Connect| DBConnection
    DBConnection <-->|Read/Write| StudentDB
    
    %% Response Flows
    StudentDB -->|Return Data| DBQueries
    DBQueries -->|Result| StudentService_Backend
    StudentService_Backend -->|JSON Response| GetHandler
    StudentService_Backend -->|JSON Response| PostHandler
    StudentService_Backend -->|JSON Response| UpdateHandler
    StudentService_Backend -->|JSON Response| DeleteHandler
    StudentRouter -->|HTTP Response| StudentService
    StudentService -->|Parse JSON| StudentTable
    StudentService -->|Parse JSON| StudentForm
    
    style Frontend fill:#9B59B6,stroke:#6C3A7C,color:#fff,stroke-width:2px
    style API fill:#3498DB,stroke:#2C5282,color:#fff,stroke-width:2px
    style Services fill:#2ECC71,stroke:#1E7E39,color:#fff,stroke-width:2px
    style Database fill:#E67E22,stroke:#A55A1F,color:#fff,stroke-width:2px
    style DataStore fill:#E74C3C,stroke:#A61E1E,color:#fff,stroke-width:2px
```

---

## 📁 Project Structure

```
.
├── app.py                      # Server entry point
├── router.py                   # HTTP routing logic
├── requirements.txt            # Python dependencies
├── controllers/
│   └── students.py            # HTTP request handlers
├── services/
│   └── student_service.py      # Business logic
├── database/
│   ├── connection.py           # Database connection
│   └── queries.py              # SQL queries
├── core/
│   ├── middleware.py           # CORS & request processing
│   ├── request.py              # Request parsing
│   ├── responses.py            # Response formatting
│   └── static.py               # Static file serving
└── frontend/
    ├── pages/                  # HTML pages
    └── assets/
        ├── css/                # Stylesheets
        └── js/                 # JavaScript modules
            ├── app.js          # Main app entry
            ├── components/     # UI components
            ├── controllers/    # Frontend logic
            ├── services/       # API communication
            ├── router/         # View routing
            ├── state/          # State management
            └── utils/          # Helper functions
```

---

## 🚀 Data Flow Summary

### Complete Request-Response Cycle:

1. **User Input**: User interacts with UI in the browser
2. **Component Processing**: JavaScript components handle user input
3. **API Request**: Student Service makes HTTP request to backend
4. **Route Matching**: Router directs request to appropriate handler
5. **Middleware Processing**: CORS and header middleware processes request
6. **Business Logic**: Student Service processes the request
7. **Database Query**: Database layer executes SQL queries
8. **Data Retrieval**: SQLite returns requested data
9. **Response Building**: Service builds JSON response
10. **HTTP Response**: API returns response to frontend
11. **UI Update**: Frontend updates DOM and displays data to user

---

## 🔧 Technology Stack

- **Backend**: Python, HTTPServer
- **Frontend**: Vanilla JavaScript (No frameworks)
- **Database**: SQLite
- **Architecture**: Layered/N-tier architecture