<?php

function calculateMonthlyPayment($balance, $periods, $interestRate){
    # https://en.wikipedia.org/wiki/Amortization_%28business%29
    $monthlyPayment = $loan * (( 1 - pow(1 + $interestRate, -$loanDurationInMonth)) / $interestRate);
    return $monthlyPayment;
}

function calculateIntrestRate($monthlyPayment, $periods, $balance){
    $interestRate = ($monthlyPayment * $periods ) - $balance;
    return $intrestRate
}
?>