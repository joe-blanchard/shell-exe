if [ $2 == + -o $2 == - -o $2 == / ]
then
	echo $(($1 $2 $3))
elif [ $2 == x -o $2 == * ]
then
	echo $(($1 * $3))
else
	echo "Mauvais argument(s)"
fi
