<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Restoran - Bootstrap Restaurant Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">


</head>

<body>
<div class="d3"></div>
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="https://d3js.org/d3.v7.min.js"></script>
<script src="https://unpkg.com/topojson-client@3"></script>
<script src="https://d3js.org/queue.v1.min.js"></script>

<script>

import koreaMap from '/metaus/map/skorea-municipalities-topo.json';
const geojson = topojson.feature(koreaMap, koreaMap.objects.skorea_municipalities_geo);
const center = d3.geoCentroid(geojson);

const width = 1000;
const height = 1000;
const svg = d3
.select('.d3')
.append('svg')
.attr('width', width).attr('height', height);
const map = svg.append('g'); 

let projection = d3.geoMercator()
.scale(1)
.translate([0, 0]); 

const path = d3.geoPath().projection(projection);
const bounds = path.bounds(geojson);
const widthScale = (bounds[1][0] - bounds[0][0]) / width; 
const heightScale = (bounds[1][1] - bounds[0][1]) / height; 
const scale = 1 /Math.max(widthScale, heightScale);
const xoffset = width/2 - scale * (bounds[1][0] + bounds[0][0]) /2 + 10; 
const yoffset = height/2 - scale * (bounds[1][1] + bounds[0][1])/2 + 80; 
const offset = [xoffset, yoffset];
projection.scale(scale).translate(offset);

map
.selectAll('path').data(geojson.features)
.enter().append('path') 
.attr('d', path);  
 
</script>

</body>

</html>