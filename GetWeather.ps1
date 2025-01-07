function Get-Weather {
    param (
        [string]$cityName,
        [double]$lat = 29.700001,
        [double]$lon = -98.116669,
        [ValidateSet("imperial", "metric")] 
        [string]$units = "imperial"
    )

    if ($CityName) {
        $geoUrl = "https://geocoding-api.open-meteo.com/v1/search?name=$CityName&count=1&format=json"
        $geoResponse = Invoke-RestMethod -Uri $geoUrl
        if ($geoResponse.results) {
            $lat = $geoResponse.results[0].latitude
            $lon = $geoResponse.results[0].longitude
        }
    }

    Invoke-RestMethod -Uri "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=$units&appid=your_app_id_here"
}
set-alias weather Get-Weather