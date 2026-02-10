# Service layer — business logic for student operations

from database.queries import (
    db_get_all,
    db_get_one,
    db_create,
    db_update,
    db_delete
)

def service_get_all():
    """Get all students"""
    return db_get_all()

def service_get_one(student_id):
    """Get a single student by ID"""
    return db_get_one(student_id)

def service_create(data):
    """Create a new student"""
    return db_create(data)

def service_update(student_id, data):
    """Update an existing student"""
    return db_update(student_id, data)

def service_delete(student_id):
    """Delete a student"""
    return db_delete(student_id)
