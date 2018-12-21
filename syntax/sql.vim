" Vim syntax file
" Language:     SQL with SQLite and other additions.
"
" More complete SQL matching with error reporting.
" Only matches types inside 'CREATE TABLE ();'.
" Highlights functions. Unknown functions are an error.
" Based on the SQL syntax files that come with Vim.

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" All non-contained SQL syntax.
syn cluster sqlALL          contains=TOP

" Various error conditions.
"syn match   sqlError        "\<\w\+("           " Not a known function.
syn match   sqlError        ")"                 " Lonely closing paren.
syn match   sqlError        ",\(\_\s*[;)]\)\@=" " Comma before a paren or semicolon.
syn match   sqlError        " $"                " Space at the end of a line.
" Comma before certain words.
syn match   sqlError        ",\_\s*\(\<\(asc\|desc\|exists\|for\|from\)\>\)\@="
syn match   sqlError        ",\_\s*\(\<\(group by\|into\|limit\|order\)\>\)\@="
syn match   sqlError        ",\_\s*\(\<\(table\|using\|where\)\>\)\@="

" Special words.
syn keyword sqlSpecial      false null true

" Keywords
syn keyword sqlKeyword      access add before after aggregate as asc authorization
syn keyword sqlKeyword      begin by cache cascade check cluster collate
syn keyword sqlKeyword      collation column compress conflict connect connection
syn keyword sqlKeyword      constraint current cursor database debug decimal declare
syn keyword sqlKeyword      default definer desc each else elsif escape exception
syn keyword sqlKeyword      exclusive explain external file for foreign from function
syn keyword sqlKeyword      group having identified if immediate increment index
syn keyword sqlKeyword      initial inner into is join key left level loop
syn keyword sqlKeyword      maxextents mode modify nocompress nowait object of
syn keyword sqlKeyword      off offline on online option order outer pctfree
syn keyword sqlKeyword      primary privileges procedure public raise references
syn keyword sqlKeyword      referencing release resource return returns returning role row rowid
syn keyword sqlKeyword      rowlabel rownum rows schema session share size
syn keyword sqlKeyword      start security successful synonym then to transaction trigger
syn keyword sqlKeyword      uid user using validate values view virtual whenever
syn keyword sqlKeyword      where with without
syn match   sqlKeyword      "\<prompt\>"
syn match   sqlKeyword      "\<glob\>"
" Do special things with CREATE TABLE ( below.
syn match   sqlKeyword      "\<table\>"

" SQLite Pragmas - Treat them as keywords.
syn keyword sqlKeyword      auto_vacuum automatic_index cache_size
syn keyword sqlKeyword      case_sensitive_like checkpoint_fullfsync
syn keyword sqlKeyword      collation_list compile_options count_changes
syn keyword sqlKeyword      database_list default_cache_size
syn keyword sqlKeyword      empty_result_callbacks encoding foreign_key_list
syn keyword sqlKeyword      foreign_keys freelist_count full_column_names
syn keyword sqlKeyword      fullfsync ignore_check_constraints
syn keyword sqlKeyword      incremental_vacuum index_info index_list
syn keyword sqlKeyword      integrity_check journal_mode journal_size_limit
syn keyword sqlKeyword      language legacy_file_format locking_mode max_page_count
syn keyword sqlKeyword      page_count page_size parser_trace quick_check
syn keyword sqlKeyword      read_uncommitted recursive_triggers
syn keyword sqlKeyword      reverse_unordered_selects schema_version
syn keyword sqlKeyword      secure_delete short_column_names synchronous
syn keyword sqlKeyword      table_info temp_store temp_store_directory
syn keyword sqlKeyword      user_version vdbe_listing vdbe_trace type
syn keyword sqlKeyword      wal_autocheckpoint wal_checkpoint writable_schema

" Operators
syn keyword sqlOperator     all and any between case distinct elif else end
syn keyword sqlOperator     exit exists if in intersect is like match matches
syn keyword sqlOperator     minus not or out prior regexp some then union
syn keyword sqlOperator     unique when
syn match   sqlOperator     "||\|:="

" Conditionals
syn match   sqlConditional  "=\|<\|>\|+\|-"

" Unknown functions.
syn match   sqlUnknownFunc  "\<\w\+(\@="

" Functions - Only valid with a '(' after them.
syn match   sqlFunction     "\<\(abs\|acos\|asin\|atan2\?\|avg\|cardinality\)(\@="
syn match   sqlFunction     "\<\(cast\|changes\|char_length\|character_length\)(\@="
syn match   sqlFunction     "\<\(coalesce\|concat\|cos\|count\|\(date\)\?\(time\)\?\)(\@="
syn match   sqlFunction     "\<\(exp\|filetoblob\|filetoclob\|floor\|glob\|group_concat\)(\@="
syn match   sqlFunction     "\<\(hex\|ifnull\|initcap\|isnull\|julianday\|last_insert_rowid\)(\@="
syn match   sqlFunction     "\<\(length\|log10\|logn\|lower\|lpad\|ltrin\|max\|min\)(\@="
syn match   sqlFunction     "\<\(mod\|nullif\|octet_length\|pow\|quote\|random\)(\@="
syn match   sqlFunction     "\<\(range\|replace\|root\|round\|rpad\|sin\|soundex\)(\@="
syn match   sqlFunction     "\<\(sqrtstdev\|strftime\|substr\|substring\|sum\|sysdate\|tan\)(\@="
syn match   sqlFunction     "\<\(to_char\|to_date\|to_number\|total\|trim\|trunc\|typeof\)(\@="
syn match   sqlFunction     "\<\(upper\|variance\)(\@="

" Oracle DBMS functions.
syn match   sqlFunction     "\<dbms_\w\+\.\w\+(\@="

" Oracle Exception Functions.
syn match   sqlFunction     "\<raise_application_error(\@="

" SQLite Functions
syn match   sqlFunction     "\<\(last_insert_rowid\|load_extension\|randomblob\)(\@="
syn match   sqlFunction     "\<\(sqlite_compileoption_get\|sqlite_compileoption_used\)(\@="
syn match   sqlFunction     "\<\(sqlite_source_id\|sqlite_version\|sqlite_version\)(\@="
syn match   sqlFunction     "\<\(zeroblob\|ltrim\|rtrim\)(\@="

" SQLite Command Line Client Functions
syn match   sqlFunction     "^\.\w\+"

" Statements
syn keyword sqlStatement    alter analyze audit begin comment commit delete
syn keyword sqlStatement    drop execute explain grant insert lock noaudit
syn keyword sqlStatement    query rename revoke rollback savepoint select
syn keyword sqlStatement    truncate update vacuum
syn match   sqlStatement    "\<\(replace\|create\)\>"

" SQLite Statements
syn keyword sqlStatement    attach detach indexed pragma reindex

" Types - Only matched inside 'CREATE TABLE ();'.
syn keyword sqlType         bigint bit blob bool boolean byte char
syn keyword sqlType         clob date datetime dec decimal enum
syn keyword sqlType         float int int8 integer interval jsonb long
syn keyword sqlType         longblob longtext lvarchar mediumblob
syn keyword sqlType         mediumint mediumtext mlslabel money
syn keyword sqlType         multiset nchar number numeric nvarchar
syn keyword sqlType         raw real rowid serial serial8 set
syn keyword sqlType         smallfloat smallint text time
syn keyword sqlType         timestamp tinyblob tinyint tinytext
syn keyword sqlType         varchar varchar2 varray year zone
syn match   sqlType         "\<\(character\|double\|varying\)\>"
syn match   sqlType         "\<character\s\+varying\>"
syn match   sqlType         "\<double\s\+precision\>"

" Oracle Variables
syn match   sqlVariable     "&\a\w\+"
syn match   sqlVariable     ":\w\+"
syn match   sqlVariable     "SQL%\w\+"

" Strings
syn region sqlString        start=+"+  skip=+\\\\\|\\"+  end=+"+ contains=sqlVariable
syn region sqlString        start=+'+  skip=+\\\\\|\\'+  end=+'+ contains=sqlVariable
syn region sqlString        start=+`+  skip=+\\\\\|\\`+  end=+`+ contains=sqlVariable
syn match  sqlString        "\$\w*\$"
syn match  sqlString        "%"

" Numbers
syn match sqlNumber         "-\=\<[0-9]*\>"
syn match sqlNumber         "-\=\<[0-9]*\.[0-9]*\>"
syn match sqlNumber         "-\=\<[0-9][0-9]*e[+-]\=[0-9]*\>"
syn match sqlNumber         "-\=\<[0-9]*\.[0-9]*e[+-]\=[0-9]*\>"
syn match sqlNumber         "\<0x[abcdef0-9]*\>"

" Todo
syn keyword sqlTodo         contained DEBUG FIXME NOTE TODO XXX

" Comments
syn region sqlComment       start="/\*"  end="\*/" contains=sqlTodo
syn match  sqlComment       "--.*$" contains=sqlTodo
syn match  sqlComment       "\(^\|\s\)rem.*$" contains=sqlTodo

" Mark correct paren use. Different colors for different purposes.
syn region  sqlParens       transparent matchgroup=sqlParen start="(" end=")"
syn match   sqlParenEmpty   "()"
syn region  sqlParens       transparent matchgroup=sqlParenFunc start="\(\<\w\+\>\)\@<=(" end=")"

" Highlight types correctly inside create table and procedure statements.
" All other SQL is properly highlighted as well.
syn region  sqlTypeParens   contained matchgroup=sqlType start="(" end=")" contains=@sqlALL
syn match   sqlTypeMatch    contained "\(\(^\|[,(]\)\s*\S\+\s\+\)\@<=\w\+\(\s*([^)]\+)\)\?" contains=sqlType,sqlTypeParens
syn match   sqlTypeMatch    contained "\(\(^\|[,(]\)\s*\S\+\s\+\)\@<=character\s\+varying\s*([^)]\+)" contains=sqlType,sqlTypeParens
syn region  sqlTypeRegion   matchgroup=sqlParen start="\(create\s\+table\s\+[^(]\+\s\+\)\@<=(" end=")" contains=@sqlALL,sqlTypeMatch
syn region  sqlTypeRegion   matchgroup=sqlParen start="\(create\s\+\(or\s\+replace\s\+\)\?procedure\s\+[^(]\+\s*\)\@<=(" end=")" contains=@sqlALL,sqlTypeMatch

" SQL Embedded in a statement.
syn region  sqlquoteRegion  matchgroup=sqlParen start="\(execute\s\+immediate\s*\)\@<=('" end="')" contains=@sqlALL

" Special Oracle Statements
syn match   sqlStatement    "^\s*\(prompt\|spool\)\>" nextgroup=sqlAnyString
syn match   sqlStatement    "^\s*accept\s\+" nextgroup=sqlAnyVariable
syn match   sqlStatement    "declare\s\+" nextgroup=sqlDeclare
syn region  sqlDeclare      contained matchgroup=sqlVariable start="\a\w\+" end="$" contains=@sqlALL,sqlType
syn match   sqlOperator     "^@" nextgroup=sqlAnyString
syn match   sqlAnyVariable  contained "\a\w\+"
syn match   sqlAnyString    contained ".*" contains=sqlVariable

syn region  sqlSetRegion    matchgroup=sqlStatement start="^\s*set\>" matchgroup=NONE end="$" contains=sqlSetOptions,sqlSetValues
syn keyword sqlSetOptions   contained autorecovery colsep copytypecheck describe escchar flagger
syn keyword sqlSetOptions   contained instance logsource long null recsep recsepchar
syn keyword sqlSetOptions   contained
syn match   sqlSetOptions   contained "\<\(app\w*\|array\w*\|auto\w*\|autop\w*\)\>"
syn match   sqlSetOptions   contained "\<\(autot\w*\|blo\w*\|cmds\w*\|con\w*\|copyc\w*\)\>"
syn match   sqlSetOptions   contained "\<\(def\w*\|echo\|editf\w*\|emb\w*\|errorl\w*\|esc\w*\)\>"
syn match   sqlSetOptions   contained "\<\(feed\w*\|flu\w*\|hea\w*\|heads\w*\|lin\w*\)\>"
syn match   sqlSetOptions   contained "\<\(lobof\w*\|longc\w*\|mark\w*\|newp\w*\|numf\w*\)\>"
syn match   sqlSetOptions   contained "\<\(pages\w*\|pau\w*\|serverout\w*\|shift\w*\|show\w*\)\>"
syn match   sqlSetOptions   contained "\<\(sqlbl\w*\|sqlc\w*\|sqlco\w*\|sqln\w*\|sqlpluscompat\w*\)\>"
syn match   sqlSetOptions   contained "\<\(sqlpre\w*\|sqlp\w*\|sqlt\w*\|suf\w*\|tab\)\>"
syn match   sqlSetOptions   contained "\<\(term\w*\|timi\w*\|und\w*\|ver\w*\|wra\w\?\)\>"
syn match   sqlSetOptions   contained "\<\(xquery\s\+\(baseuri\|ordering\|node\|context\)\)\>"
syn keyword sqlSetValues    contained all body byreference byvalue default
syn keyword sqlSetValues    contained entry fill head html identifier indent
syn keyword sqlSetValues    contained linenum local none off on size table truncate
syn match   sqlSetValues    contained "\<\(ea\w*\|wr\w*\|imm\w*\|trace\w*\|expl\w*\|stat\w*\)\>"
syn match   sqlSetValues    contained "\<\(intermed\w*\|pre\w*\|unl\w*\|for\w*\|wra\w*\|wor\w\?\)\>"
syn match   sqlSetValues    contained "\<\(vis\w*\|inv\w*\)\>"
syn match   sqlSetValues    contained "\<\(\(un\)\?ordered\)\>"

" PostGIS
syn keyword sqlFunction contained addauth addgeometrycolumn
syn keyword sqlFunction contained addoverviewconstraints addrasterconstraints box box2d
syn keyword sqlFunction contained box2d_in box2d_out box2df_in
syn keyword sqlFunction contained box2df_out box3d box3d_in box3d_out
syn keyword sqlFunction contained box3dtobox bytea checkauth checkauthtrigger
syn keyword sqlFunction contained contains_2d disablelongtransactions
syn keyword sqlFunction contained dropgeometrycolumn dropgeometrytable
syn keyword sqlFunction contained dropoverviewconstraints droprasterconstraints
syn keyword sqlFunction contained enablelongtransactions equals find_srid
syn keyword sqlFunction contained geog_brin_inclusion_add_value geography geography_analyze
syn keyword sqlFunction contained geography_cmp geography_distance_knn geography_eq
syn keyword sqlFunction contained geography_ge geography_gist_compress
syn keyword sqlFunction contained geography_gist_consistent geography_gist_decompress
syn keyword sqlFunction contained geography_gist_distance geography_gist_penalty
syn keyword sqlFunction contained geography_gist_picksplit geography_gist_same
syn keyword sqlFunction contained geography_gist_union geography_gt geography_in
syn keyword sqlFunction contained geography_le geography_lt geography_out
syn keyword sqlFunction contained geography_overlaps geography_recv
syn keyword sqlFunction contained geography_send geography_typmod_in geography_typmod_out
syn keyword sqlFunction contained geom2d_brin_inclusion_add_value
syn keyword sqlFunction contained geom3d_brin_inclusion_add_value geom4d_brin_inclusion_add_value
syn keyword sqlFunction contained geometry geometry_above geometry_analyze
syn keyword sqlFunction contained geometry_below geometry_cmp
syn keyword sqlFunction contained geometry_contained_3d geometry_contained_by_raster
syn keyword sqlFunction contained geometry_contains geometry_contains_3d
syn keyword sqlFunction contained geometry_distance_box geometry_distance_centroid
syn keyword sqlFunction contained geometry_distance_centroid_nd geometry_distance_cpa geometry_eq
syn keyword sqlFunction contained geometry_ge geometry_gist_compress_2d
syn keyword sqlFunction contained geometry_gist_compress_nd geometry_gist_consistent_2d
syn keyword sqlFunction contained geometry_gist_consistent_nd
syn keyword sqlFunction contained geometry_gist_decompress_2d geometry_gist_decompress_nd
syn keyword sqlFunction contained geometry_gist_distance_2d geometry_gist_distance_nd
syn keyword sqlFunction contained geometry_gist_penalty_2d geometry_gist_penalty_nd
syn keyword sqlFunction contained geometry_gist_picksplit_2d geometry_gist_picksplit_nd
syn keyword sqlFunction contained geometry_gist_same_2d geometry_gist_same_nd
syn keyword sqlFunction contained geometry_gist_union_2d geometry_gist_union_nd
syn keyword sqlFunction contained geometry_gt geometry_hash geometry_in
syn keyword sqlFunction contained geometry_le geometry_left geometry_lt
syn keyword sqlFunction contained geometry_out geometry_overabove geometry_overbelow
syn keyword sqlFunction contained geometry_overlaps geometry_overlaps_3d
syn keyword sqlFunction contained geometry_overlaps_nd geometry_overleft
syn keyword sqlFunction contained geometry_overright geometry_raster_contain
syn keyword sqlFunction contained geometry_raster_overlap geometry_recv geometry_right
syn keyword sqlFunction contained geometry_same geometry_same_3d geometry_send
syn keyword sqlFunction contained geometry_spgist_choose_2d geometry_spgist_choose_3d
syn keyword sqlFunction contained geometry_spgist_compress_2d
syn keyword sqlFunction contained geometry_spgist_compress_3d geometry_spgist_config_2d
syn keyword sqlFunction contained geometry_spgist_config_3d geometry_spgist_inner_consistent_2d
syn keyword sqlFunction contained geometry_spgist_inner_consistent_3d
syn keyword sqlFunction contained geometry_spgist_leaf_consistent_2d geometry_spgist_leaf_consistent_3d
syn keyword sqlFunction contained geometry_spgist_picksplit_2d
syn keyword sqlFunction contained geometry_spgist_picksplit_3d geometry_typmod_in
syn keyword sqlFunction contained geometry_typmod_out geometry_within geometrytype
syn keyword sqlFunction contained geomfromewkb geomfromewkt get_proj4_from_srid
syn keyword sqlFunction contained gettransactionid gidx_in gidx_out
syn keyword sqlFunction contained gserialized_gist_joinsel_2d gserialized_gist_joinsel_nd
syn keyword sqlFunction contained gserialized_gist_sel_2d gserialized_gist_sel_nd
syn keyword sqlFunction contained is_contained_2d lockrow longtransactionsenabled
syn keyword sqlFunction contained overlaps_2d overlaps_geog overlaps_nd
syn keyword sqlFunction contained path pgis_asgeobuf_finalfn
syn keyword sqlFunction contained pgis_asgeobuf_transfn pgis_asmvt_combinefn pgis_asmvt_deserialfn
syn keyword sqlFunction contained pgis_asmvt_finalfn pgis_asmvt_serialfn
syn keyword sqlFunction contained pgis_asmvt_transfn pgis_geometry_accum_finalfn
syn keyword sqlFunction contained pgis_geometry_accum_transfn
syn keyword sqlFunction contained pgis_geometry_clusterintersecting_finalfn pgis_geometry_clusterwithin_finalfn
syn keyword sqlFunction contained pgis_geometry_collect_finalfn
syn keyword sqlFunction contained pgis_geometry_makeline_finalfn pgis_geometry_polygonize_finalfn
syn keyword sqlFunction contained pgis_geometry_union_finalfn point polygon
syn keyword sqlFunction contained populate_geometry_columns postgis_addbbox
syn keyword sqlFunction contained postgis_cache_bbox postgis_constraint_dims
syn keyword sqlFunction contained postgis_constraint_srid postgis_constraint_type
syn keyword sqlFunction contained postgis_dropbbox postgis_extensions_upgrade
syn keyword sqlFunction contained postgis_full_version postgis_gdal_version
syn keyword sqlFunction contained postgis_geos_version postgis_getbbox postgis_hasbbox
syn keyword sqlFunction contained postgis_lib_build_date postgis_lib_version
syn keyword sqlFunction contained postgis_libjson_version postgis_liblwgeom_version
syn keyword sqlFunction contained postgis_libprotobuf_version postgis_libxml_version
syn keyword sqlFunction contained postgis_noop postgis_proj_version
syn keyword sqlFunction contained postgis_raster_lib_build_date postgis_raster_lib_version
syn keyword sqlFunction contained postgis_raster_scripts_installed
syn keyword sqlFunction contained postgis_scripts_build_date postgis_scripts_installed
syn keyword sqlFunction contained postgis_scripts_released postgis_svn_version
syn keyword sqlFunction contained postgis_transform_geometry postgis_type_name postgis_typmod_dims
syn keyword sqlFunction contained postgis_typmod_srid postgis_typmod_type
syn keyword sqlFunction contained postgis_version raster_above raster_below
syn keyword sqlFunction contained raster_contain raster_contained
syn keyword sqlFunction contained raster_contained_by_geometry raster_eq raster_geometry_contain
syn keyword sqlFunction contained raster_geometry_overlap raster_hash
syn keyword sqlFunction contained raster_in raster_left raster_out
syn keyword sqlFunction contained raster_overabove raster_overbelow raster_overlap
syn keyword sqlFunction contained raster_overleft raster_overright raster_right
syn keyword sqlFunction contained raster_same spheroid_in spheroid_out
syn keyword sqlFunction contained st_3dclosestpoint st_3ddfullywithin st_3ddistance
syn keyword sqlFunction contained st_3ddwithin st_3dextent st_3dintersects
syn keyword sqlFunction contained st_3dlength st_3dlength_spheroid
syn keyword sqlFunction contained st_3dlongestline st_3dmakebox st_3dmaxdistance
syn keyword sqlFunction contained st_3dperimeter st_3dshortestline st_accum
syn keyword sqlFunction contained st_addband st_addmeasure st_addpoint
syn keyword sqlFunction contained st_affine st_angle st_approxcount
syn keyword sqlFunction contained st_approxhistogram st_approxquantile st_approxsummarystats
syn keyword sqlFunction contained st_area st_area2d st_asbinary
syn keyword sqlFunction contained st_asencodedpolyline st_asewkb st_asewkt
syn keyword sqlFunction contained st_asgdalraster st_asgeobuf st_asgeojson
syn keyword sqlFunction contained st_asgml st_ashexewkb st_ashexwkb st_asjpeg
syn keyword sqlFunction contained st_askml st_aslatlontext st_asmvt
syn keyword sqlFunction contained st_asmvtgeom st_aspect st_aspng st_asraster
syn keyword sqlFunction contained st_assvg st_astext st_astiff
syn keyword sqlFunction contained st_astwkb st_aswkb st_asx3d st_azimuth
syn keyword sqlFunction contained st_band st_bandfilesize st_bandfiletimestamp
syn keyword sqlFunction contained st_bandisnodata st_bandmetadata
syn keyword sqlFunction contained st_bandnodatavalue st_bandpath st_bandpixeltype
syn keyword sqlFunction contained st_bdmpolyfromtext st_bdpolyfromtext st_boundary
syn keyword sqlFunction contained st_boundingdiagonal st_box2dfromgeohash
syn keyword sqlFunction contained st_buffer st_buildarea st_centroid
syn keyword sqlFunction contained st_chaikinsmoothing st_cleangeometry st_clip
syn keyword sqlFunction contained st_clipbybox2d st_closestpoint st_closestpointofapproach
syn keyword sqlFunction contained st_clusterdbscan st_clusterintersecting
syn keyword sqlFunction contained st_clusterkmeans st_clusterwithin st_collect
syn keyword sqlFunction contained st_collectionextract st_collectionhomogenize
syn keyword sqlFunction contained st_colormap st_combine_bbox st_combinebbox
syn keyword sqlFunction contained st_concavehull st_contains
syn keyword sqlFunction contained st_containsproperly st_convexhull st_coorddim st_count
syn keyword sqlFunction contained st_countagg st_coveredby st_covers
syn keyword sqlFunction contained st_cpawithin st_createoverview st_crosses
syn keyword sqlFunction contained st_curvetoline st_delaunaytriangles
syn keyword sqlFunction contained st_dfullywithin st_difference st_dimension
syn keyword sqlFunction contained st_disjoint st_distance st_distance_sphere
syn keyword sqlFunction contained st_distance_spheroid st_distancecpa st_distancesphere
syn keyword sqlFunction contained st_distancespheroid st_distinct4ma st_dump
syn keyword sqlFunction contained st_dumpaspolygons st_dumppoints
syn keyword sqlFunction contained st_dumprings st_dumpvalues st_dwithin st_endpoint
syn keyword sqlFunction contained st_envelope st_equals
syn keyword sqlFunction contained st_estimated_extent st_estimatedextent st_expand st_extent
syn keyword sqlFunction contained st_exteriorring st_filterbym
syn keyword sqlFunction contained st_find_extent st_findextent st_flipcoordinates
syn keyword sqlFunction contained st_force2d st_force3d st_force3dm st_force3dz
syn keyword sqlFunction contained st_force4d st_force_2d st_force_3d
syn keyword sqlFunction contained st_force_3dm st_force_3dz st_force_4d
syn keyword sqlFunction contained st_force_collection st_forcecollection
syn keyword sqlFunction contained st_forcecurve st_forcepolygonccw st_forcepolygoncw
syn keyword sqlFunction contained st_forcerhr st_forcesfs st_frechetdistance
syn keyword sqlFunction contained st_fromgdalraster st_gdaldrivers
syn keyword sqlFunction contained st_generatepoints st_geogfromtext st_geogfromwkb
syn keyword sqlFunction contained st_geographyfromtext st_geohash st_geomcollfromtext
syn keyword sqlFunction contained st_geomcollfromwkb st_geometricmedian
syn keyword sqlFunction contained st_geometryfromtext st_geometryn st_geometrytype
syn keyword sqlFunction contained st_geomfromewkb st_geomfromewkt
syn keyword sqlFunction contained st_geomfromgeohash st_geomfromgeojson st_geomfromgml
syn keyword sqlFunction contained st_geomfromkml st_geomfromtext
syn keyword sqlFunction contained st_geomfromtwkb st_geomfromwkb st_georeference
syn keyword sqlFunction contained st_geotransform st_gmltosql st_grayscale
syn keyword sqlFunction contained st_hasarc st_hasnoband st_hausdorffdistance
syn keyword sqlFunction contained st_height st_hillshade st_histogram
syn keyword sqlFunction contained st_interiorringn st_interpolatepoint st_intersection
syn keyword sqlFunction contained st_intersects st_invdistweight4ma st_isclosed
syn keyword sqlFunction contained st_iscollection st_iscoveragetile
syn keyword sqlFunction contained st_isempty st_ispolygonccw st_ispolygoncw
syn keyword sqlFunction contained st_isring st_issimple st_isvalid
syn keyword sqlFunction contained st_isvaliddetail st_isvalidreason st_isvalidtrajectory
syn keyword sqlFunction contained st_length st_length2d st_length2d_spheroid
syn keyword sqlFunction contained st_length2dspheroid st_length_spheroid
syn keyword sqlFunction contained st_lengthspheroid st_line_interpolate_point
syn keyword sqlFunction contained st_line_locate_point st_line_substring
syn keyword sqlFunction contained st_linecrossingdirection st_linefromencodedpolyline
syn keyword sqlFunction contained st_linefrommultipoint st_linefromtext st_linefromwkb
syn keyword sqlFunction contained st_lineinterpolatepoint st_lineinterpolatepoints
syn keyword sqlFunction contained st_linelocatepoint st_linemerge
syn keyword sqlFunction contained st_linestringfromwkb st_linesubstring st_linetocurve
syn keyword sqlFunction contained st_locate_along_measure st_locate_between_measures
syn keyword sqlFunction contained st_locatealong st_locatebetween
syn keyword sqlFunction contained st_locatebetweenelevations st_longestline st_m
syn keyword sqlFunction contained st_makebox2d st_makeemptycoverage st_makeemptyraster
syn keyword sqlFunction contained st_makeenvelope st_makeline st_makepoint
syn keyword sqlFunction contained st_makepointm st_makepolygon
syn keyword sqlFunction contained st_makevalid st_mapalgebra st_mapalgebraexpr
syn keyword sqlFunction contained st_mapalgebrafct st_mapalgebrafctngb st_max4ma
syn keyword sqlFunction contained st_maxdistance st_mean4ma st_mem_size
syn keyword sqlFunction contained st_memcollect st_memsize st_memunion
syn keyword sqlFunction contained st_metadata st_min4ma st_minconvexhull
syn keyword sqlFunction contained st_mindist4ma st_minimumboundingcircle
syn keyword sqlFunction contained st_minimumboundingradius st_minimumclearance
syn keyword sqlFunction contained st_minimumclearanceline st_minpossiblevalue st_mlinefromtext
syn keyword sqlFunction contained st_mlinefromwkb st_mpointfromtext
syn keyword sqlFunction contained st_mpointfromwkb st_mpolyfromtext st_mpolyfromwkb
syn keyword sqlFunction contained st_multi st_multilinefromwkb
syn keyword sqlFunction contained st_multilinestringfromtext st_multipointfromtext st_multipointfromwkb
syn keyword sqlFunction contained st_multipolyfromwkb st_multipolygonfromtext
syn keyword sqlFunction contained st_ndims st_nearestvalue st_neighborhood
syn keyword sqlFunction contained st_node st_normalize
syn keyword sqlFunction contained st_notsamealignmentreason st_npoints st_nrings st_numbands
syn keyword sqlFunction contained st_numgeometries st_numinteriorring
syn keyword sqlFunction contained st_numinteriorrings st_numpatches st_numpoints
syn keyword sqlFunction contained st_offsetcurve st_orderingequals
syn keyword sqlFunction contained st_orientedenvelope st_overlaps st_patchn st_perimeter
syn keyword sqlFunction contained st_perimeter2d st_pixelascentroid
syn keyword sqlFunction contained st_pixelascentroids st_pixelaspoint st_pixelaspoints
syn keyword sqlFunction contained st_pixelaspolygon st_pixelaspolygons
syn keyword sqlFunction contained st_pixelheight st_pixelofvalue st_pixelwidth
syn keyword sqlFunction contained st_point st_point_inside_circle st_pointfromgeohash
syn keyword sqlFunction contained st_pointfromtext st_pointfromwkb
syn keyword sqlFunction contained st_pointinsidecircle st_pointn st_pointonsurface
syn keyword sqlFunction contained st_points st_polyfromtext st_polyfromwkb
syn keyword sqlFunction contained st_polygon st_polygonfromtext
syn keyword sqlFunction contained st_polygonfromwkb st_polygonize st_project st_quantile
syn keyword sqlFunction contained st_quantizecoordinates st_range4ma
syn keyword sqlFunction contained st_rastertoworldcoord st_rastertoworldcoordx
syn keyword sqlFunction contained st_rastertoworldcoordy st_rastfromhexwkb st_rastfromwkb
syn keyword sqlFunction contained st_reclass st_relate st_relatematch
syn keyword sqlFunction contained st_removepoint st_removerepeatedpoints
syn keyword sqlFunction contained st_resample st_rescale st_resize st_reskew
syn keyword sqlFunction contained st_retile st_reverse st_rotate st_rotatex
syn keyword sqlFunction contained st_rotatey st_rotatez st_rotation
syn keyword sqlFunction contained st_roughness st_samealignment st_scale
syn keyword sqlFunction contained st_scalex st_scaley st_segmentize
syn keyword sqlFunction contained st_setbandindex st_setbandisnodata st_setbandnodatavalue
syn keyword sqlFunction contained st_setbandpath st_seteffectivearea
syn keyword sqlFunction contained st_setgeoreference st_setgeotransform st_setpoint
syn keyword sqlFunction contained st_setrotation st_setscale st_setskew
syn keyword sqlFunction contained st_setsrid st_setupperleft st_setvalue
syn keyword sqlFunction contained st_setvalues st_sharedpaths st_shift_longitude
syn keyword sqlFunction contained st_shiftlongitude st_shortestline
syn keyword sqlFunction contained st_simplify st_simplifypreservetopology st_simplifyvw
syn keyword sqlFunction contained st_skewx st_skewy st_slope st_snap
syn keyword sqlFunction contained st_snaptogrid st_split st_srid
syn keyword sqlFunction contained st_startpoint st_stddev4ma st_subdivide
syn keyword sqlFunction contained st_sum4ma st_summary st_summarystats
syn keyword sqlFunction contained st_summarystatsagg st_swapordinates st_symdifference
syn keyword sqlFunction contained st_symmetricdifference st_tile st_touches
syn keyword sqlFunction contained st_tpi st_transform st_translate
syn keyword sqlFunction contained st_transscale st_tri st_unaryunion st_union
syn keyword sqlFunction contained st_upperleftx st_upperlefty st_value
syn keyword sqlFunction contained st_valuecount st_valuepercent st_voronoilines
syn keyword sqlFunction contained st_voronoipolygons st_width st_within
syn keyword sqlFunction contained st_wkbtosql st_wkttosql st_worldtorastercoord
syn keyword sqlFunction contained st_worldtorastercoordx st_worldtorastercoordy
syn keyword sqlFunction contained st_wrapx st_x st_xmax st_xmin
syn keyword sqlFunction contained st_y st_ymax st_ymin st_z st_zmax
syn keyword sqlFunction contained st_zmflag st_zmin text unlockrows
syn keyword sqlFunction contained updategeometrysrid updaterastersrid
syn keyword sqlTable contained spatial_ref_sys
syn keyword sqlType contained addbandarg agg_count agg_samealignment
syn keyword sqlType contained box2d box2df box3d geography
syn keyword sqlType contained geometry geometry_dump geomval gidx
syn keyword sqlType contained rastbandarg raster reclassarg spheroid
syn keyword sqlType contained summarystats unionarg valid_detail
syn keyword sqlView contained geography_columns geometry_columns
syn keyword sqlView contained raster_columns raster_overviews
syn keyword sqlFunction contained geometry_eq pgis_abs_in pgis_abs_out pgis_abs


" Stolen from sh.vim.
if !exists("sh_minlines")
  let sh_minlines = 200
endif
if !exists("sh_maxlines")
  let sh_maxlines = 2 * sh_minlines
endif
exec "syn sync minlines=" . sh_minlines . " maxlines=" . sh_maxlines

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sql_syn_inits")
    if version < 508
        let did_sql_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink sqlComment       Comment
    HiLink sqlError         Error
    HiLink sqlFunction      Function
    HiLink sqlUnknownFunc   Exception
    HiLink sqlKeyword       Special
    HiLink sqlConditional   Conditional
    HiLink sqlNumber        Number
    HiLink sqlOperator      Operator
    HiLink sqlParen         Comment
    HiLink sqlParenEmpty    Operator
    HiLink sqlParenFunc     Function
    HiLink sqlSpecial       Keyword
    HiLink sqlStatement     Statement
    HiLink sqlString        String
    HiLink sqlTodo          Todo
    HiLink sqlType          Type
    HiLink sqlVariable      Identifier

    HiLink sqlAnyString     sqlString
    HiLink sqlAnyVariable   sqlVariable
    HiLink sqlSetOptions    Operator
    HiLink sqlSetValues     Special

    delcommand HiLink
endif

let b:current_syntax = "sql"
