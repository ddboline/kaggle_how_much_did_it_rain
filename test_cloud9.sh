#!/bin/bash

scp ddboline@ddbolineathome.mooo.com:/home/ddboline/setup_files/build/kaggle_how_much_did_it_rain/how_much_did_it_rain.tar.gz .
tar zxvf how_much_did_it_rain.tar.gz
rm how_much_did_it_rain.tar.gz

# ./split_csv.py > output.out 2> output.err ### do this beforehand...
# ./load_data.py > output.out 2> output.err 
# ./my_model.py 0 69 > output.out 2> output.err
./my_model.py $(($1*10)) $(($1*10+9)) > output.out 2> output.err

# D=`date +%Y%m%d%H%M%S`
# tar zcvf output_${D}.tar.gz model.pkl.gz output.out output.err
scp model_*.pkl.gz ddboline@ddbolineathome.mooo.com:/home/ddboline/setup_files/build/kaggle_how_much_did_it_rain/
ssh ddboline@ddbolineathome.mooo.com "~/bin/send_to_gtalk done_kaggle_how_much_did_it_rain"
echo "JOB DONE how_much_did_it_rain"
