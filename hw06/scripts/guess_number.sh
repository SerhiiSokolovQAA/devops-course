#!/usr/bin/env bash
number=$(( RANDOM % 100 + 1 ))
max_attempts=5

for (( attempt=1; attempt<=max_attempts; attempt++ )); do
    read -r -p "Попытка $attempt/$max_attempts. Введите число от 1 до 100: " guess

    if ! [[ "$guess" =~ ^[0-9]+$ ]] || (( 10#$guess < 1 || 10#$guess > 100 )); then
        echo "Пожалуйста, введите целое число от 1 до 100."
        (( attempt-- ))
        continue
    fi
    guess=$(( 10#$guess ))

    if (( guess == number )); then
        echo "Поздравляем! Вы угадали правильное число."
        exit 0
    elif (( guess > number )); then
        echo "Слишком высоко"
    else
        echo "Слишком низко"
    fi
done

echo "Извините, у вас закончились попытки. Правильным числом было $number"
exit 1
