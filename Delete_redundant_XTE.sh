
declare -a myarray
let i=0
while IFS=$'\n' read -r line_data; 
do
    	myarray[i]="${line_data}"
	#find . -type f -name $myarray -delete
	#find . -name $myarray -type f -exec rm {} \;
	find /home/ankush/Desktop/Workspace_project/1A_2466-588/RXTE/Data/*/*/ | rm -r $myarray
	#\rm -r $myarray
    	((i++))
done < /home/ankush/Desktop/Workspace_project/1A_2466-588/RXTE/Workspace/FilestoDelete.txt		#change this to point to the input list file containing the additive models you want to fit the data with
