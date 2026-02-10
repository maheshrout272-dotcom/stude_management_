##################### API Observation Via Codespace URL
##################### API Observation Via Hopscotch
##################### API Observation Via CURL

# A. Get All Students
curl -X GET "https://humble-broccoli-r4q7g7r6qg94hpg4r-8000.app.github.dev/api/students"

# B. Get One Student
curl -X GET "http://localhost:8000/api/students/1"

# C. Create Student
curl -X POST "https://humble-broccoli-r4q7g7r6qg94hpg4r-8000.app.github.dev/api/students" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Alice 06-12-2025",
    "email": "alice@example.com",
    "course": "Computer Science",
    "year": 2
  }'

# # D. Update Student
curl -X PUT "https://humble-broccoli-r4q7g7r6qg94hpg4r-8000.app.github.dev/api/students/1" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Alice 1",
    "email": "alice_1@example.com",
    "course": "Data Science",
    "year": 1
  }'

# # E. Delete Student
curl -X DELETE "https://humble-broccoli-r4q7g7r6qg94hpg4r-8000.app.github.dev/api/students/4"


# ##################### DB Observation Via SQLite Web
# - install https://github.com/coleifer/sqlite-web
# - pip install sqlite-web
# - sqlite_web students.db