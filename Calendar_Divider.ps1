$Games = @"
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

$Games = ($Games -split '[\r\n]') |? {$_} 

$Objects = $Games.count

Clear-Host
if ([System.DateTime]::isleapyear((Get-Date -Format yyyy))){
$Days_in_Month = @(31,29,31,30,31,30,31,31,30,31,30,31)}ELSE{$Days_in_Month = @(31,28,31,30,31,30,31,31,30,31,30,31)}
$Name_of_Month = @("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
$X = 0
$Y = 0
$Div = [math]::floor((($Days_in_Month | Measure-Object -Sum).sum) / $Objects)
$StartDay = (Get-Date).DayofYear
$Counter = 0
# Loop through every object
for ($j = 0;$j -lt $Objects){
    $X = 0
    $month = $Days_in_Month[$X]
    $Date += $Name_of_Month[$X]
    if (!$Counter){$Counter = $Div+1}
    # Loop through every day of the year
    for ($i = 0;$i -lt 365;$i++){
        # if $DIV days haven't passed yet, or if the count hasn't surpassed the current date just increment the counter
        if ($Counter -lt $Div){
            $Counter++
        #  Count has passed the current date, and the counter is greater than or equal to $Div days, Time to output!
        }ELSEIF($i -ge $StartDay){
            $Counter = 1
            $j++
            Write-Host ($Name_of_Month[$X] +" "+ ($i - $month + $Days_in_Month[$X]) +" == " + $Games[$Y++] )
        }
        # if current day of the year minus sum of days of previous months equals zero, it's a new month
        if ($i - $month -eq 0){
            $month = $Days_in_Month[$X++] + $i
        }
        # The number of objects have all been handled, time to stop!
        if ($j -eq $Objects){break}
    }
    # Happy New Year!, Start at day 1
    $StartDay = 1
}

