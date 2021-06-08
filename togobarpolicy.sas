libname alcpolicy "C:\Users\awalk55\OneDrive - Emory University\Desktop\Tobacco and Alcohol Study";

proc import datafile="C:\Users\awalk55\OneDrive - Emory University\Desktop\Tobacco and Alcohol Study\joined_togo_policy_and_bar_outcomes_data.csv"
        out=statepolicyoutcomes
        dbms=csv
        replace;
        getnames=yes;
run;

%macro sfreqs(var);
proc surveyfreq data=statepolicyoutcomes;
cluster fips;
table &var*(beer wine mixed_drinks)/row chisq cl;
run;
%mend;

%sfreqs(alcohol_togo_APIS_bars);
%sfreqs(alcohol_togo_APIS_rest);
%sfreqs(NABCA_spirits_bars);
%sfreqs(NABCA_spirits_rest);
%sfreqs(Suggested_code_bar);
%sfreqs(Suggested_code_rest);



