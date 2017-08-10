$objects = @{"The Legend of Zelda" = 2
"Zelda II: The Adventure of Link" = 2
"A Link to the Past" = 3
"Link's Awakening" = 4
"Ocarina of Time" = 6
"Master Quest" = 5
"Majora's Mask" = 5
"Oracle of Ages & Oracle of Seasons" = 8
"Four Swords" = 1
"The Wind Waker" = 7
"Four Swords Adventures" = 3
"The Minish Cap" = 4
"Twilight Princess" = 8
"Phantom Hourglass" = 4
"Spirit Tracks" = 5
"Skyward Sword" = 9
"A Link Between Worlds" = 4
"Tri Force Heroes" = 4
"Breath of the Wild" = 17
}

Clear-Host

# Define Counters
$X = 0

# Set initial year and dayofyear
$Year = (Get-Date).Year; $DayOfYear = (Get-Date).DayOfYear

# Loop through every object in the array
$Objects.GetEnumerator() | Sort -Property Value | ForEach-Object{

    # Fetch the date to start the current object in the array
    $Date_To_Start = (([datetime]"01/01/$($Year)").AddDays($DayOfYear - 1).ToString("yyyy-MM-dd"))
    
    #Output!
    Write-Host ("$Date_To_Start == " + ($_.Key) ) 
    
    # Find whole number of days to be the divisor
    $Div = 365 * ($_.Value / 100)

    # Increment the day of year by the divisor
    $DayOfYear = $DayOfYear + $Div

    # Subtract the days of the year from the DayOFYear counter depending on leap year 
    if([System.DateTime]::isleapyear(($Year)) -and ($DayOfYear -gt 366)){
        $DayOfYear = $DayOfYear - 366; $Year++

    }ELSEIF((![System.DateTime]::isleapyear(($Year)) -and ($DayOfYear -gt 365))){
        $DayOfYear = $DayOfYear - 365; $Year++
    }
}   
pause
