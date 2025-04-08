from flask import Blueprint, request, jsonify
from werkzeug.security import generate_password_hash, check_password_hash
from flask_jwt_extended import create_access_token

auth_blueprint = Blueprint('auth', __name__)

# Временное хранилище пользователей
users = {
    "admin": generate_password_hash("password123"),
    "user1": generate_password_hash("mypassword")
}

@auth_blueprint.route('/register', methods=['POST'])
def register():
    data = request.get_json()

    if not data or 'username' not in data or 'password' not in data:
        return jsonify({"error": "Требуется username и password"}), 400

    username = data['username']
    password = data['password']

    if username in users:
        return jsonify({"error": "Пользователь уже существует"}), 400

    users[username] = generate_password_hash(password)
    return jsonify({"message": "Пользователь создан!"}), 201

@auth_blueprint.route('/login', methods=['POST'])
def login():
    data = request.get_json()

    if not data or 'username' not in data or 'password' not in data:
        return jsonify({"error": "Требуется username и password"}), 400

    username = data['username']
    password = data['password']

    if username not in users or not check_password_hash(users[username], password):
        return jsonify({"error": "Неверный логин или пароль"}), 401

    access_token = create_access_token(identity=username)
    return jsonify({"access_token": access_token}), 200