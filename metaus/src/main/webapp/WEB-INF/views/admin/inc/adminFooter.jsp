<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Metaus 2022</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃하시기 전, 현재 진행중인 작업이 완료되었는지 다시 한번 확인해주십시오.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="<c:url value='/admin/login/adminLogout'/>">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value='/admin/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/admin/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/admin/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value='/admin/js/sb-admin-2.min.js'/>"></script>

    <!-- Page level plugins -->
    <script src="<c:url value='/admin/vendor/datatables/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value='/admin/js/demo/datatables-demo.js'/>"></script>

</body>

</html>