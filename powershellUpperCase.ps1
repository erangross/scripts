# Define the path of the input file
$inputFilePath = "C:\Users\EranGross\Documents\test.txt"

# Read the content of the file
$content = Get-Content $inputFilePath

# Process the content
$processedContent = $content | ForEach-Object { $_.ToUpper() }

# Define the path of the output file
$outputFilePath = "C:\Users\EranGross\Documents\output.txt"

# Write the processed content to the new file
$processedContent | Set-Content $outputFilePath