/opt/virtuoso-opensource/bin/isql -H localhost PROMPT=OFF VERBOSE=OFF BANNER=OFF <<-EOF
    ld_dir('/RdfGraphs', '*.ttl', 'http://dice.opal.de/graph#23112018');
    SELECT 'importing this file / these files:';
    SELECT ll_file FROM DB.DBA.LOAD_LIST WHERE ll_state = 0;
    SELECT 'starting import', CURRENT_TIMESTAMP();
    rdf_loader_run();
    checkpoint;
    commit work;
    checkpoint;
    SELECT 'import finished', CURRENT_TIMESTAMP();
    SELECT 'graph http://dice.opal.de/graph#23112018 now contains n triples:';
    sparql SELECT COUNT(*) as ?c { GRAPH <http://dice.opal.de/graph#23112018> {?s ?p ?o.} };
EOF
