<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Messagebox
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Messagebox</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-md-3">
              <a href="#" class="btn btn-primary btn-block margin-bottom btn-compose">메세지 작성</a>
              <div class="box box-solid">
                <div class="box-header with-border">
                  <h3 class="box-title">Folders</h3>
                </div>
                <div class="box-body no-padding">
                  <ul class="nav nav-pills nav-stacked">
                    <li><a href="#" class="receivedMail"><i class="fa fa-inbox"></i> 받은 메세지 <span class="label label-primary pull-right receivedNo">${receivedNo }</span></a></li>
                    <li><a href="#" class="sentMail"><i class="fa fa-envelope-o"></i> 보낸 메세지 <span class="label label-success pull-right sentNo">${sentNo }</span></a></li>
                    <li><a href="#" class="starMail"><i class="fa fa-star"></i> 별표 메세지 <span class="label label-waring pull-right starNo">${starNo }</span></a></li>
                    <li><a href="#" class="temporaryMail"><i class="fa fa-file-text-o"></i> 임시보관함 <span class="label label-info pull-right temporaryNo">${temporaryNo }</span></a></li>
                    <li><a href="#" class="spamMail"><i class="fa fa-filter"></i> 스팸함 <span class="label label-danger pull-right spamNo">${spamNo }</span></a></li>
                    <li><a href="#" class="trashMail"><i class="fa fa-trash-o"></i> 휴지통 <span class="label label-danger pull-right trashNo">${trashNo }</span></a></li>
                  </ul>
                </div><!-- /.box-body -->
              </div><!-- /. box -->
            </div><!-- /.col -->
            <div class="col-md-9">
              <div class="box box-primary">
              
              	<!-- ajax 결과 -->
              	
              </div><!-- /. box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->