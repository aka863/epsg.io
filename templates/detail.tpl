<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"  lang="en" xml:lang="en">
  <head>  
    <meta charset="utf-8"/>
%if alt_title:
    <title>{{name}} - {{alt_title}} - {{type_epsg}}:{{item['code']}}</title>
%else:
    <title>{{name}} - {{type_epsg}}:{{item['code']}}</title>
%end    
    
    
    <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="EPSG:{{item['code']}} {{kind}} for {{item['area']}} {{item['remarks']}} {{item['scope']}}" />
    <meta name="keywords" content="EPSG.io" />
    <meta name="robots" content="ALL,FOLLOW" />
    <link rel="stylesheet" href="/css/main.css" type="text/css" />
    <link rel="shortcut icon" href="http://epsg.io/favicon.ico" />
    <script src="/js/index.js"></script>
    
  </head>
  <body id="detailpage" data-role="page">
    <div id="head">
      <p id="logo-container">
        <a href="/" title=""><span>Epsg.io</span> Coordinate systems worldwide</a>
      </p>
      <ul id="menu-top">
        <li><a href="/about" title="">About</a></li>
      </ul>
    </div>
    <div id="layout-container">
      
      %if item['deprecated'] == 1:
        <h1>EPSG:{{code_short[0]}} DEPRECATED</h1>
      
      %else:
        %if item['information_source'] == "ESRI":
        <h1>{{type_epsg}}:{{code_short[0]}}</h1>
        %else:
          <h1>{{type_epsg}}:{{code_short[0]}}</h1>
        %end
      %end
      <p>
        <a href="{{url_kind}}">{{kind}} </a>
      </p>
      
      <h2>{{name}}<br /> {{alt_title}}</h2>


      <p>
        
%if 'scope' in item:
%if item['scope']:
          Scope: {{item['scope']}}<br />
%end
%end
        

%if detail:
        %if detail[0]['url_area'] == "":
          Area of use: <a href="{{detail[0]['url_area']}}"> {{item['area']}}</a><br />
        %end
%else:
        %if item['area']:
          Area of use: <a href="{{url_area}}">{{area_item}}</a><br />
        %end
%end


%if 'remarks' in item:
%if item['remarks']:
        Remarks: {{item['remarks']}}<br />
%end
%end


%if 'information_source' in item:
%if item['information_source']:
        Information source: {{item['information_source']}}<br />
%end
%end

%if 'revision_date' in item:
%if item['revision_date']:
        Revision date: {{item['revision_date']}}<br />
%end
%end

%if 'concatop' in item:
%if item['concatop']:
        Steps of transformation: {{item['concatop']}}<br />
%end
%end

%if nadgrid:
        NadGrid file: {{nadgrid}}<br />
%end

%if 'source_geogcrs' in item:
  %if item['source_geogcrs']:
        Geodetic coordinate reference system: <a href="/{{item['source_geogcrs'][0]}}" title="">{{item['source_geogcrs'][1]}}</a><br />

%end
%end

%if 'datum' in item:
  %if item['datum'] != 0 and item['datum'] :
        Datum: <a href="/{{item['datum'][0]}}-datum/" title="">{{item['datum'][1]}}</a><br />
  %end
%end



%if 'coord_sys' in item:
%if item['coord_sys']:
  Coordinate system: <a href="/{{item['coord_sys'][0]}}-coordsys">{{item['coord_sys'][1]}}</a><br />
%end
%end

%if item['target_uom']:
%if int(code_short[0]) != int(item['target_uom'][0]):

        Target uom: <a href="/{{item['target_uom'][0]}}-units">{{item['target_uom'][1]}}</a><br />
%end
%end

%if item['uom_code']:
        Unit: <a href="/{{item['uom_code']}}-units/">{{item['uom']}}</a><br />
%end

%if item['files']:
        File: {{item['files']}}<br />
%end

%if item['orientation']:
        Orientation: {{item['orientation']}}<br />
%end

%if item['abbreviation']:
        Abrev: {{item['abbreviation']}}<br />
%end

%if item['order']:
        Axis order: {{item['order']}}.<br />
%end

%if 'description' in item:
%if item['description']:
        Description: {{item['description']}}<br />
%end
%end


%if 'ellipsoid' in item:
%if item['ellipsoid']:
  Ellipsoid: <a href="/{{item['ellipsoid'][0]}}-ellipsoid">{{item['ellipsoid'][1]}}</a><br />
%end
%end

%if "method" in item:
%if item['method']:
Method: <a href="/{{item['method'][0]}}-method" title="">{{item['method'][1]}}</a><br />
%end
%end

%if 'data_source' in item:
 %if item['data_source']:
  Data source: {{item['data_source']}} <br />
%end
%end

%if 'prime_meridian' in item:
%if item['prime_meridian']:
  Prime meridian: <a href="/{{item['prime_meridian'][0]}}-primemeridian">{{item['prime_meridian'][1]}}</a>
  %if 'greenwich_longitude' in item:
    %if item['prime_meridian'][0] != 8901 and detail != [] and item['greenwich_longitude'] !=0:
      ({{item['greenwich_longitude']}} degree from Greenwich)<br />
    %else:
    <br />
    %end
    
  %else:
  <br />
  %end
  
%end
%end
%if detail != []:
%if 'greenwich_longitude' in item:
%if item['greenwich_longitude'] != 0 and item['greenwich_longitude']:
    {{item['greenwich_longitude']}} degree from Greenwich<br />
%end
%end
%end
%if detail != []:
%if detail[0]['url_axis']:
        
  %for a in detail[0]['url_axis']:
        Link to axis : <a href="/{{a['axis_code']}}-axis">{{a['axis_name']}}</a><br />
  %end
        
%end
%end

%if 'alt_description' in item:
%if item['alt_description']:
%if item['wkt']:
  Alternative description: {{!item['alt_description']}}<br />
%else:
  %if export_html:
  <div id="description-message">{{!export_html}} </div>
  %else:
  <div id="description-message">{{!item['alt_description']}} </div>
  %end
%end
%end
%end

%if 'alt_code' in item:
 %if item['alt_code'] != ['']:
  Alternatives codes : 
  %for a in item['alt_code']:
    <a href="/{{a}}">{{a}}</a>
  %end
 %end
%end

      </p>
      
      <div id="detail-content-container">
        <div class="map-container">
%if item['bbox']:
%if center:
%if trans_lat:
          <div id="mini-map">
            <a href="{{url_format}}/coordinates">
            <img src="/img/epsg-target-small.png" id="crosshair" alt="" />
              <img src="http://maps.googleapis.com/maps/api/staticmap?size=235x190&scale=2&sensor=false&visual_refresh=true&center={{center[0]}},{{center[1]}}&path=color:0xff0000ff|fillcolor:0xff000022|weight:2|{{g_coords}}" alt="SimpleMap" height="190" width="235">
              
            </a>
          </div>
%else:
<div id="mini-map">
  <img src="/img/epsg-target-small.png" id="crosshair" alt="" />
    <img src="http://maps.googleapis.com/maps/api/staticmap?size=235x190&scale=2&sensor=false&visual_refresh=true&center={{center[0]}},{{center[1]}}&path=color:0xff0000ff|fillcolor:0xff000022|weight:2|{{g_coords}}" alt="SimpleMap" height="190" width="235">
</div>
          
%end
        
          
%end
%end

%if trans_lat and trans_lon:
          <p>
            Center coordinates<br />
            <span>{{trans_lat}}</span>  <span>{{trans_lon}}</span>
          </p>
%end
%if projcrs_by_gcrs:
%if kind == "Projected coordinate system":
  Projected CRS with the same GCS ({{item['source_geogcrs'][0]}}): <br />
%else:
  Links to Projected CRS: <br />
%end
%end

%for r in projcrs_by_gcrs:
  <a href="/{{r['result']['code']}}">EPSG:{{r['result']['code']}} {{r['result']['name']}}</a>
  %if r['result']['code_trans']:
  <a href="{{r['result']['code']}}/coordinates"> (map)</a> <br />
  %else:
  <br />
  %end
%end

        </div>
        <div class="location-data-container">
%if trans:
%for r in trans:
          <h2>
  %if r['link'] == "" and r['area_trans']:
              {{r['area_trans']}} <br />
    %if r['code_trans'] != 0:
              code {{r['code_trans']}} 
    %end
    %if r['default'] == True:
              DEFAULT
    %end    
          </h2>
              
    %if r['accuracy']:
              Accuracy {{r['accuracy']}} m 
    %end

  %end
%end
%end
%if center and trans_lat and trans_lon:
          <p class="btn-link-container">
            <a href="{{url_format}}/coordinates" title=""><i></i>Get position on a map</a>
          </p>
%end
%if trans and default_trans:
          <p>
            %if default_trans['method']:
              Method: <a href="/{{default_trans['method'][0]}}-method" title="">{{default_trans['method'][1]}}</a><br />
            %end
            Area of use: <a href="{{url_area_trans}}">{{default_trans['area']}}</a><br />
            Remarks: {{default_trans['remarks']}}<br />
            Information source: {{default_trans['information_source']}}<br />
            Revision date: {{default_trans['revision_date']}}<br />
%if url_concatop != []:
            Steps of transformation: 
  %for url in url_concatop:
            <a href="{{url}}" title="">{{url}} </a>
  %end
%end
          </p>
%end
        </div>
%if trans:
        <div class="transformations-container">
          <h3>Available transformations:</h3>
          <ul>
% i = 0
%deprecated_available = False
%for r in trans:
  %if not deprecated_available and r['deprecated'] == 1 :
    %deprecated_available = True
  %end
  
  %if r['link'] == "" and r['deprecated'] == 0 and r['area_trans']:
            <li> {{r['area_trans']}}
    %if r['accuracy']:
            , accuracy {{r['accuracy']}} m, 
    %end
    %if r['code_trans'] != 0:
            code {{r['code_trans']}} 
    %end
    %if r['default'] == True:
            DEFAULT
    %end
    % i +=1
            </li>
  %elif r['deprecated'] == 0 and r['area_trans']:
            <li>
            <a href="/{{r['link']}}" title = "{{r['trans_remarks']}}">{{r['area_trans']}}, accuracy 
            {{r['accuracy']}} m, code {{r['code_trans']}} 
    %if r['default'] == True:
            DEFAULT
    %end
            </a>
    %i+=1
            </li>

  %end
%end

%if deprecated_available:
%if i == 0:
  <div id="trans_deprecated">
%else:
  <a href="#" id="trans_deprecated_link">Show deprecated transformations</a>
  <div id="trans_deprecated">
%end

%a = 0
%for r in trans:
  %if r['deprecated'] == 1:
    %if r['link'] == "":
            <li>{{r['area_trans']}}, accuracy {{r['accuracy']}} m, code {{r['code_trans']}} DEPRECATED
      %if r['default'] == True:
          DEFAULT
      %end
            </li>
    %else:
            <li>
            <a href="/{{r['link']}}" title = "{{r['trans_remarks']}}">{{r['area_trans']}}, accuracy {{r['accuracy']}} m,  code {{r['code_trans']}} DEPRECATED
      %if r['default'] == True:
          DEFAULT
      %end
            </a>
            </li>
    %end
    %a+=1
  %end
%end
%end
        </div>
        </ul>
        
%end
      </div>
</div>
      
%if url_format and error_code == 0:
      <div id="edit-box-container">
        <div id="eb-menu-container">
          <h4>Export</h4>
          <ul id="eb-menu">
            <li><a class="selected" href="" title="" onClick="javascript:document.getElementById('code-definition-container-html').style.display='block'; return false">Well Known Text as HTML<i></i></a></li>
            <li><a href="" title="" onClick="javascript:document.getElementById('code-definition-container-prettywkt').style.display='block'; return false">PrettyWKT <i></i></a></li>
            <li><a href="" title="" onClick="javascript:document.getElementById('code-definition-container-esriwkt').style.display='block'; return false">ESRI WKT <i></i></a></li>
            <li><a href="{{url_format}}/prj" title="">Download file {{item['code']}}.prj <i></i></a></li>
            <li><a href="" title="" onClick="javascript:document.getElementById('code-definition-container-proj4').style.display='block'; return false">PROJ.4 <i></i></a></li>
            <li><a href="" title="" onClick="javascript:document.getElementById('code-definition-container-gml').style.display='block'; return false">OGC GML <i></i></a></li>
            <li><a href="" title="" onClick="javascript:document.getElementById('code-definition-container-geoserver').style.display='block'; return false">GeoServer <i></i></a></li>
            <li><a href="" title="" onClick="javascript:document.getElementById('code-definition-container-mapfile').style.display='block'; return false">MAPfile <i></i></a></li>
            <li><a href="" title="" onClick="javascript:document.getElementById('code-definition-container-mapserverpython').style.display='block'; return false">MapSever - Python <i></i></a></li>
            <li><a href="" title="" onClick="javascript:document.getElementById('code-definition-container-mapnik').style.display='block'; return false">mapnik <i></i></a></li>
            <li><a href="" title="" onClick="javascript:document.getElementById('code-definition-container-mapnikpython').style.display='block'; return false">mapnik - Python <i></i></a></li>
            <li><a href="" title="" onClick="javascript:document.getElementById('code-definition-container-postgis').style.display='block'; return false">PostGIS <i></i></a></li>
            <li><a href="" title="" onClick="javascript:document.getElementById('code-definition-container-json').style.display='block'; return false">JSON <i></i></a></li>
            <li><a href="" title="" onClick="javascript:document.getElementById('code-definition-container-ogcwkt').style.display='block'; return false">OGC WKT <i></i></a></li>
            <li><a href="" title="" onClick="javascript:document.getElementById('code-definition-container-usgs').style.display='block'; return false">USGS <i></i></a></li>
          </ul>
        </div>
        <div class="code-definition-container" id="code-html">
          <p>Definition: Well Known Text as HTML</p>
          <ul>
            <li><a href="{{url_format}}/html" title="">Open in new page</a></li>
            <li><a href="#" title="">Copy URL to clipboard</a></li>
            <li><a href="#" title="">Copy TEXT to clipboard</a></li>
          </ul>
          <div class="syntax">
            {{!export_html}}
          </div>
        </div>
        <div class="code-definition-container" id="code-prettywkt">
          <p>Definition: PrettyWKT</p>
          <ul>
            <li><a href="{{url_format}}/prettywkt" title="">Open in new page</a></li>
            <li><a href="#" title="">Copy URL to clipboard</a></li>
            <li><a href="#" title="">Copy TEXT to clipboard</a></li>
          </ul>
          <div class="syntax">
            {{!export['prettywkt']}}
          </div>
        </div>
        <div class="code-definition-container" id="code-esriwkt">
          <p>Definition: ESRI WKT</p>
          <ul>
            <li><a href="{{url_format}}/esriwkt" title="">Open in new page</a></li>
            <li><a href="#" title="">Copy URL to clipboard</a></li>
            <li><a href="#" title="">Copy TEXT to clipboard</a></li>
          </ul>
          <div class="syntax">
            {{export['esriwkt']}}
            
          </div>
        </div>
        <div class="code-definition-container" id="code-prj">
          <p>Definition: Download file {{item['code']}}.prj</p>          
          <ul>
            <li><a href="{{url_format}}/prj" title="">Open in new page</a></li>
            <li><a href="#" title="">Copy URL to clipboard</a></li>
            <li><a href="#" title="">Copy TEXT to clipboard</a></li>
          </ul>
          <div class="syntax">
            {{!export}}
          </div>
        </div>
        <div class="code-definition-container-proj4">
          <p>Definition: PROJ.4</p>
          <ul id="cd-tabs">
            <li><a href="{{url_format}}/proj4" title="">Open in new page</a></li>
            <li><a href="#" title="">Copy URL to clipboard</a></li>
            <li><a href="#" title="">Copy TEXT to clipboard</a></li>
          </ul>
          <div class="syntax">
            {{export['proj4']}}
          </div>
        </div>
        <div class="code-definition-container-gml">
          <p>Definition: OGC GML</p>
          <ul id="cd-tabs">
            <li><a href="{{url_format}}/gml" title="">Open in new page</a></li>
            <li><a href="#" title="">Copy URL to clipboard</a></li>
            <li><a href="#" title="">Copy TEXT to clipboard</a></li>
          </ul>
          <div class="syntax">
            {{export['gml']}}
          </div>
        </div>
        <div class="code-definition-container-geoserver">
          <p>Definition: GeoServer</p>
          <ul id="cd-tabs">
            <li><a href="{{url_format}}/geoserver" title="">Open in new page</a></li>
            <li><a href="#" title="">Copy URL to clipboard</a></li>
            <li><a href="#" title="">Copy TEXT to clipboard</a></li>
          </ul>
          <div class="syntax">
            {{export['geoserver']}}
          </div>
        </div>
        <div class="code-definition-container-mapfile">
          <p>Definition: MAPfile</p>
          <ul class="cd-tabs">
            <li><a href="{{url_format}}/mapfile" title="">Open in new page</a></li>
            <li><a href="#" title="">Copy URL to clipboard</a></li>
            <li><a href="#" title="">Copy TEXT to clipboard</a></li>
          </ul>
          <div class="syntax">
            {{!export['mapfile']}}
          </div>
        </div>
        <div class="code-definition-container-mapserverpython">
          <p>Definition: MapSever - Python</p>
          <ul id="cd-tabs">
            <li><a href="{{url_format}}/mapserverpython" title="">Open in new page</a></li>
            <li><a href="#" title="">Copy URL to clipboard</a></li>
            <li><a href="#" title="">Copy TEXT to clipboard</a></li>
          </ul>
          <div class="syntax">
            {{!export['mapserverpython']}}
          </div>
        </div>
        <div class="code-definition-container-mapnik">
          <p>Definition: mapnik</p>
          <ul id="cd-tabs">
            <li><a href="{{url_format}}/mapnik" title="">Open in new page</a></li>
            <li><a href="#" title="">Copy URL to clipboard</a></li>
            <li><a href="#" title="">Copy TEXT to clipboard</a></li>
          </ul>
          <div class="syntax">
            {{!export['mapnik']}}
          </div>
        </div>
        <div class="code-definition-container-mapnikpython">
          <p>Definition: mapnik - Python</p>
          <ul id="cd-tabs">
            <li><a href="{{url_format}}/mapnikpython" title="">Open in new page</a></li>
            <li><a href="#" title="">Copy URL to clipboard</a></li>
            <li><a href="#" title="">Copy TEXT to clipboard</a></li>
          </ul>
          <div class="syntax">
            {{!export['mapnikpython']}}
          </div>
        </div>
        <div class="code-definition-container-postgis">
          <p>Definition: PostGIS</p>
          <ul id="cd-tabs">
            <li><a href="{{url_format}}/postgis" title="">Open in new page</a></li>
            <li><a href="#" title="">Copy URL to clipboard</a></li>
            <li><a href="#" title="">Copy TEXT to clipboard</a></li>
          </ul>
          <div class="syntax">
            {{!export['postgis']}}
          </div>
        </div>
        <div class="code-definition-container-json">
          <p>Definition: JSON</p>
          <ul id="cd-tabs">
            <li><a href="{{url_format}}/json" title="">Open in new page</a></li>
            <li><a href="#" title="">Copy URL to clipboard</a></li>
            <li><a href="#" title="">Copy TEXT to clipboard</a></li>
          </ul>
          <div class="syntax">
            {{!export['json']}}
          </div>
        </div>
        <div class="code-definition-container-ogcwkt">
          <p>Definition: OGC WKT</p>
          <ul id="cd-tabs">
            <li><a href="{{url_format}}/ogcwkt" title="">Open in new page</a></li>
            <li><a href="#" title="">Copy URL to clipboard</a></li>
            <li><a href="#" title="">Copy TEXT to clipboard</a></li>
          </ul>
          <div class="syntax">
            {{!export['ogcwkt']}}
          </div>
        </div>
        <div class="code-definition-container-usgs">
          <p>Definition: USGS</p>
          <ul id="cd-tabs">
            <li><a href="{{url_format}}/usgs" title="">Open in new page</a></li>
            <li><a href="#" title="">Copy URL to clipboard</a></li>
            <li><a href="#" title="">Copy TEXT to clipboard</a></li>
          </ul>
          <div class="syntax">
            {{!export['usgs']}}
          </div>
        </div>        
      </div>
%end
      <div id="foot">
        <p id="mzk-logo">
          <a href="http://www.mzk.cz/" title=""><img src="./img/hzk-logo.png" alt="" /></a>
        </p>
        <p>Find a coordinate system and get position on a map.</p>
        <p id="copyright">Copyright &copy; 2014</p>
      </div>
  	<script type="text/javascript">detail_init();</script>

  </body>
</html>
