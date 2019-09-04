from flask import render_template
from werkzeug.exceptions import abort
from jinja2.exceptions import TemplateNotFound
from app import app


@app.route('/', defaults={'path': 'index.html'})
@app.route('/<path>')
def index(path):
    try:
        return render_template('layouts/default.html',
                               content=render_template('pages/'+path))
    except TemplateNotFound:
        return abort(404)
