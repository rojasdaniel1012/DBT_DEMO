{% macro create_stream(stream_name, view_name)%}

{%set query%}
CREATE STREAM IF NOT EXISTS  {{target.database}}.{{target.schema}}.{{stream_name}} ON VIEW {{view_name}}
{% endset %}

{%do run_query(query) %}

{%endmacro%}