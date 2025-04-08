from flask import Flask, render_template, request, jsonify
from flask_jwt_extended import (
    JWTManager, create_access_token, jwt_required, get_jwt_identity
)
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)

app.config['JWT_SECRET_KEY'] = 'super-secret-key-123456'
jwt = JWTManager(app)

users = {
    "admin": generate_password_hash("password123"),
    "user1": generate_password_hash("mypassword")
}


@app.route('/')
def home():
    return "Hello, World!"

@app.route('/about')
def about():
    return render_template('about.html')


# Регистрация роут пока без бд потом будем добавлять бд уже
@app.route('/register', methods=['POST'])
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


# Логин (проверяем хеш пароля)
@app.route('/login', methods=['POST'])
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


if __name__ == '__main__':
    app.run(debug=True)
