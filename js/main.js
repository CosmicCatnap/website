function loadMain(path) {
    fetch(path)
        .then((response) => response.text())
        .then((text) => (document.getElementById('main').innerHTML = text))
}
