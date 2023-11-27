

while true; do
echo "Разработчик: Шамина Екатерина 710-1, данная программа предназначена для выполнения действий над пользователями"
# проверка на пустой ввод
while true; do
	read -p "Enter the username you want to perform action on: " username
	if [ -z "$username" ]; then
		echo "Username cannot be empty" >&2
	else
		break
	fi
done

# проверка на корректный ввод
while true; do
	read -p "Do you want to block or unblock the user? (block/unblock): " action
	if [ "$action" != "block" ] && [ "$action" != "unblock" ]; then
		echo "Invalid action. Please enter 'block' or 'unblock'" >&2
	else
		break
	fi
done


# выполнение действия
if [ $action == "block" ]; then
    passwd -l $username >&2
elif [ $action == "unblock" ]; then
    passwd -u $username >&2
fi

# конец работы
while true; do
	read -p "The script has completed its work, restart? [y/n] " decide
	if [ "$decide" = "y" ]; then
		break;
	elif [ "$decide" = "n" ]; then
		exit 0;
	fi
done

done
