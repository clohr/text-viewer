# Elm Text Viewer

## Overview
Uses [Prism.js](https://prismjs.com/) and [Elm](https://elm-lang.org/) to create a basic text viewer application. Can set language and requested URL as flags:
```
<script>
  var app = Elm.Main.init({
    node: document.getElementById('app'),
    flags: {
      language: 'text',
      url: 'https://elm-lang.org/assets/public-opinion.txt'
    }
  });
</script>
```

## Initialize Project
1. `npm i --global uglifyjs elm-test`
2. `elm install`

## Build Project
`make`

## Run Web Server
`make serve`

## Run Tests
`make test`
