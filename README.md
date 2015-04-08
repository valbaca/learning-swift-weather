# learning-swift-weather
Weather app from the Udemy Swift course

This simple app takes a city name and provides a natural language description of the current weather

# Demo

![](https://raw.githubusercontent.com/valbaca/learning-swift-weather/master/Media/out.gif)


# Screenshots

Starting page:

![](https://raw.githubusercontent.com/valbaca/learning-swift-weather/master/Media/Screenshot_start.png)

After entering a valid city name and pressing the Get Weather button:

![](https://raw.githubusercontent.com/valbaca/learning-swift-weather/master/Media/Screenshot_valid.png)

Of course, a friendly error message is shown if you type an invalid city:

![](https://raw.githubusercontent.com/valbaca/learning-swift-weather/master/Media/Screenshot_error.png)

# Technical Details

The weather summary is scraped from http://www.weather-forecast.com/ and is dependent on their URL and HTML implementation. This doesn't use any defined API and thus isn't a stable app.
