<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="<c:url value="/resources/plugins/bower_components/jquery/dist/jquery.min.js"></c:url>"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="//resources/bootstrap/dist/js/bootstrap.min.js"></c:url>"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="<c:url value="/resources//plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></c:url>"></script>
    <!--slimscroll JavaScript -->
    <script src="<c:url value="//resources/js/jquery.slimscroll.js"></c:url>"></script>
    <!--Wave Effects -->
    <script src="<c:url value="/resources/js/waves.js"></c:url>"></script>
    <!--Counter js -->
    <script src="<c:url value="/resources/plugins/bower_components/waypoints/lib/jquery.waypoints.js"></c:url>"></script>
<script src="<c:url value="/resources/plugins/bower_components/counterup/jquery.counterup.min.js"></c:url>"></script>
    <!-- chartist chart -->
    <script src="<c:url value="/resources/plugins/bower_components/chartist-js/dist/chartist.min.js"></c:url>"></script>
<script src="<c:url value="/resources/plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></c:url>"></script>

    <script src="<c:url value="/resources/plugins/datatables/jquery.dataTables.min.js"></c:url>"></script>
    <!-- Sparkline chart JavaScript -->
    <script src="<c:url value="/resources/plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></c:url>"></script>
    <!-- Custom Theme JavaScript -->
    <script src="<c:url value="/resources/js/custom.min.js"></c:url>"></script>
<script src="<c:url value="/resources/js/dashboard1.js"></c:url>"></script>
<script src="<c:url value="/resources/plugins/bower_components/toast-master/js/jquery.toast.js"></c:url>"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>

<!--      jQuery 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>-->


<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCdppEFNeliRCxNUa7D_64GZLXYRWllkVY&libraries=places"></script>

<script>
    $(document).ready(function () {
        $('#myTable').DataTable();
        $(document).ready(function () {
            var table = $('#example').DataTable({
                "columnDefs": [{
                        "visible": false,
                        "targets": 2
                    }],
                "order": [
                    [2, 'asc']
                ],
                "displayLength": 25,
                "drawCallback": function (settings) {
                    var api = this.api();
                    var rows = api.rows({
                        page: 'current'
                    }).nodes();
                    var last = null;
                    api.column(2, {
                        page: 'current'
                    }).data().each(function (group, i) {
                        if (last !== group) {
                            $(rows).eq(i).before('<tr class="group"><td colspan="5">' + group + '</td></tr>');
                            last = group;
                        }
                    });
                }
            });
            // Order by the grouping
            $('#example tbody').on('click', 'tr.group', function () {
                var currentOrder = table.order()[0];
                if (currentOrder[0] === 2 && currentOrder[1] === 'asc') {
                    table.order([2, 'desc']).draw();
                } else {
                    table.order([2, 'asc']).draw();
                }
            });
        });
    });
    $('#example23').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    });
</script>

<script>
    $(document).ready(function () {
        var date_input = $('input[name="start_Date"]'); //our date input has the name "date"
        var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
        var options = {
            format: 'yyyy-mm-dd',
            container: container,
            todayHighlight: true,
            autoclose: true,
            startDate: "dateToday",
        };
        date_input.datepicker(options);
    })
</script>
<script>
    $(document).ready(function () {
        var date_input = $('input[name="end_Date"]'); //our date input has the name "date"
        var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
        var options = {
            format: 'yyyy-mm-dd',
            container: container,
            todayHighlight: true,
            autoclose: true,
            startDate: "dateToday",
        };
        date_input.datepicker(options);
    })
</script>

<script>

    function initialize() {

        var input = document.getElementById('city');

        var autocomplete = new google.maps.places.Autocomplete(input);

        google.maps.event.addListener(autocomplete, 'place_changed', function () {
            var place = autocomplete.getPlace();
            if (!place.geometry) {
                return;
            }

            var geolocation = {
                lat: autocomplete.getPlace().geometry.location.lat(),
                lng: autocomplete.getPlace().geometry.location.lng()
            };

            var circle = new google.maps.Circle({
                center: geolocation,
                radius: 300000
            });
            autocomplete2.setBounds(circle.getBounds());



        });

    }
</script>
<script>
    google.maps.event.addDomListener(window, 'load', initialize);
</script>
</body>

</html>
