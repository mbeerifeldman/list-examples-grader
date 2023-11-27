CPATH='".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

if [[ -f student-submission/ListExamples.java ]]
then echo 'Correct file provided'
else
 echo "Haven't provided correct file" 
 exit 0
fi

cp -r student-submission/* grading-area/ 
cp -r lib/ grading-area/
cp -r TestListExamples.java grading-area/

cd grading-area

javac -cp ".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar" *.java 
java -cp ".:lib/junit-4.13.2.jar:lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples >> results.txt

if [[ `grep "FAILURES!!!" results.txt` ]]
then
    echo "Tests did not all pass."
    echo `tail -n 3 results.txt`
else
    echo "All tests passed! Nice job."
fi 


