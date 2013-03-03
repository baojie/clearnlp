CLEARNLP=.
CLASSPATH=$CLEARNLP/lib/args4j-2.0.16.jar:$CLEARNLP/lib/commons-compress-1.4.1.jar:$CLEARNLP/lib/hppc-0.4.1.jar:$CLEARNLP/lib/jregex1.2_01.jar:$CLEARNLP/lib/clearnlp-1.3.1.jar

java -classpath $CLASSPATH com.googlecode.clearnlp.run.Version 

FILE=iphone5.txt

echo "Test Tokenizer"
java -classpath $CLASSPATH com.googlecode.clearnlp.run.Tokenizer \
     -d model/dictionary-1.3.1.zip -i $FILE
cat $FILE.tok

echo "Test labeling"
java -classpath $CLASSPATH -XX:+UseConcMarkSweepGC -Xmx2g \
     com.googlecode.clearnlp.nlp.NLPDecode \
     -c config_en_decode.xml \
     -i $FILE \
     -oe pos \
     -z pos
cat $FILE.pos
