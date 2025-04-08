from flask import Flask, render_template
from flask_jwt_extended import JWTManager
from auth import auth_blueprint

app = Flask(__name__)

# Конфигурация JWT
app.config['JWT_SECRET_KEY'] = 'super-secret-key-123456'
jwt = JWTManager(app)

# Регистрация blueprint с префиксом v1
app.register_blueprint(auth_blueprint, url_prefix='/v1/auth')

@app.route('/')
def home():
    return "Hello, World!"

@app.route('/v1/about')
def about():
    return render_template('about.html')

if __name__ == '__main__':
    app.run(debug=True)