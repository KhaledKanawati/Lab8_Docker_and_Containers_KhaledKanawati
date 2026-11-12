"""Lab 8 second Flask service: fetch names from the original Lab 5 database."""
from flask import Flask, jsonify
from lab5_api.database import create_db_table, get_users

app = Flask(__name__)
create_db_table()

@app.get('/get_users')
def api_get_users():
    """Return the names from the database shared with the Lab 5 container."""
    return jsonify({'users': [user['name'] for user in get_users()]})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000)
