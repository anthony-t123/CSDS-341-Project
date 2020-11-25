from flask import Flask, render_template, request
import queries

app = Flask(__name__)

@app.route('/')
def index():
    return 'Testing'

@app.route('/election')
def election():
    data = [('OH', '#0000FF')]
    return render_template('election.html', data=data)

if __name__ == '__main__':
    app.run()