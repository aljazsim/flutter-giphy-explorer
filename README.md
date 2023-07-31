# Native Giphy Explorer

Native Giphy Explorer is a native [Flutter](https://flutter.dev/) application showcasing the capabilities of the platform. It allows users to explore animated gifs (offered by [Giphy Web API](https://developers.giphy.com/)), memes (offered by [Meme Generator Web API](https://api.memegen.link)) and jokes (offered by [Joke Web API](https://v2.jokeapi.dev)) on a device (desktop, mobile or web).

![Native Giphy Explorer](./recording.gif)


## Running the application

1. ensure you have [Flutter installed](https://docs.flutter.dev/get-started/install)
2. ensure you have [VS Code installed](https://code.visualstudio.com/Download)
3. ensure you have [GIT installed](https://git-scm.com/downloads)
4. on Windows ensure you have developer mode turned on (run `ms-settings:developers` in PowerShell)
5. clone the repo at [https://github.com/aljazsim/native-giphy-explorer.git](https://github.com/aljazsim/native-giphy-explorer.git)
6. set the Giphy api key
    1. register for a developer account at [https://developers.giphy.com/](https://developers.giphy.com/)
    2. create an app
    3. copy Giphy API key
    4. set the key in `./assets/configuration.json` (setting `giphy:apiKey`)
 7. open the repo root directory in VS Code
 8. press F5
