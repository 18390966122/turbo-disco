
Window get window {
  if (_window != null) {
    return _window;
  }
  _window = _Utils.window();
  return _window;
}

HtmlDocument get document {
  if (_document != null) {
    return _document;
  }
  _document = window.document;
  return _document;
}

