function initMap(lat, lng, icon_type) {
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
        center: myCoords,
        zoom: 16
    };
    var iconBase = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/';
    var icons = {
        friend: {
            icon: "https://img.icons8.com/dusk/50/000000/user-location.png"
        },
        fullmatching: {
            icon: "https://img.icons8.com/dusk/64/000000/visit.png"
        },
        halfmatching: {
            icon: "https://img.icons8.com/wired/64/000000/visit.png"
        },
        current_user: {
            icon: "https://img.icons8.com/dusk/50/000000/marker.png"
        }
    };
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    var marker = new google.maps.Marker({
        position: myCoords,
        animation: google.maps.Animation.DROP,
        map: map,
        icon: icons[icon_type].icon,
        draggable: true
    });
}