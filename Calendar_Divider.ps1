$Objects = @"
The Legend of Zelda
Zelda II: The Adventure of Link
A Link to the Past
Link's Awakening
Ocarina of Time
Majora's Mask
Oracle of Ages & Oracle of Seasons
Four Swords
The Wind Waker
Four Swords Adventures
The Minish Cap
Twilight Princess
Phantom Hourglass
Spirit Tracks
Skyward Sword
A Link Between Worlds
Tri Force Heroes
Breath of the Wild
"@

# Turn the string into an array
$Objects = ($Objects -split '[\r\n]') |? {$_} 

Clear-Host

# Define Counters
$X = 0

# Find whole number of days to be the divisor
$Div = [math]::floor(366 / ($Objects.count))

# Set initial day, month, and year
$Year = (Get-Date).Year; $Month = ((Get-Date).Month) ; $DayOfYear = (Get-Date).DayOfYear

# Loop through every object in the array
for ($j = 0;$j -lt $Objects.Count; $j++){
    
    # Fetch the date to start the next object in the array
    $StartOfYear = [datetime]::Parse("$Year-1-1")
    $DayOfMonth = ($StartOfYear.AddDays($DayOfYear - 1)).Day
    $Date_To_Start = (([datetime]"01/01/$($Year)").AddDays($DayOfYear - 1).ToString("yyyy-MM-dd"))
    
    # Increment the day of year by the divisor
    $DayOfYear = $DayOfYear + $Div

    # Subtract the days of the year from the DayOFYear counter depending on leap year 
    if([System.DateTime]::isleapyear(($Year)) -and ($DayOfYear -gt 366)){
        $DayOfYear = $DayOfYear - 366; $Year++

    }ELSEIF((![System.DateTime]::isleapyear(($Year)) -and ($DayOfYear -gt 365))){
        $DayOfYear = $DayOfYear - 365; $Year++
    }
    
    #Output!
    Write-Host ("$Date_To_Start == "+ $Games[$X++] ) 
    
}   
pause


