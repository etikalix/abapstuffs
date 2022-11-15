*&---------------------------------------------------------------------*
*& Report ZETI_TEST1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZETI_TEST1.

tables ttzz.
select-OPTIONS: tz for ttzz-tzone.
PARAMETERS: pdate type sy-datum,
            ptime type sy-uzeit.
data: ts type /BTI/TE_DE_TIMESTAMP.
data: cont type /BTI/TE_IF_INTEGRATION_PARSER=>TY_CONTROL,
       dst         like sy-dayst..
GET TIME STAMP FIELD ts.
LOOP AT tz.
convert time stamp ts time zone tz-low into date cont-date time cont-time daylight saving time dst.
write:  / tz-low,
        / ts,
        / cont-date ,
        / cont-time ,
        / dst.
        skip.
ENDLOOP.

LOOP AT tz.
convert date pdate time ptime daylight saving time dst INTO TIME STAMP ts TIME ZONE tz-low .
write:  / tz-low,
        / pdate ,
        / ptime ,
        / ts,
        / dst.
        skip.
ENDLOOP.
