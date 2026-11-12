from flask import Flask
app = Flask(__name__)

@app.get('/')
def home():
    return 'Hello World! Docker Lab 8 is working.\n'

if __name__ == '__main__':
    print('Hello World Flask container starting on port 5000', flush=True)
    app.run(host='0.0.0.0', port=5000, debug=False)
