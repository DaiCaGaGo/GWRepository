declare
  v_object_name   varchar2(100) := 'Input object name'; -- VD: customer
  v_package_name  varchar2(100) := 'pks_' || v_object_name;
  v_script        varchar2(1000);
begin
  dbms_output.put_line('create or replace package pks_' || v_object_name || ' is');
  v_script := '  /** ----------------------------------------------------------------------------------------------------
  ** Module: ' || v_object_name || '
  ** Description: auto generate Script API Back Office template
  ** and is copyrighted by luannd.
  ** 
  **
  ** MODIFICATION HISTORY
  ** Person      Date           Comments
  ** luannd     ' || to_char(SYSDATE, 'dd/MM/rrrr') || '      Created
  ** (c) ' || to_char(SYSDATE, 'rrrr') || ' by Conek.
  ----------------------------------------------------------------------------------------------------  */';
  dbms_output.put_line(v_script);
  dbms_output.put_line('');
  -- Get all
  dbms_output.put_line('-- Lay tat ca du lieu ' || v_object_name);
  v_script := 'procedure pr_get_' || v_object_name || 's(p_refcursor   out sys_refcursor,
                           p_err_code    out varchar2,
                           p_err_message out varchar2);';
  dbms_output.put_line(v_script);
  dbms_output.put_line('');
  
  -- Get by id
  dbms_output.put_line('-- Lay du lieu ' || v_object_name || ' theo id');
  v_script := 'procedure pr_get_' || v_object_name || '(p_refcursor   out sys_refcursor,
                          p_id          in varchar2,
                          p_err_code    out varchar2,
                          p_err_message out varchar2);';
  dbms_output.put_line(v_script);
  dbms_output.put_line('');
  
  -- Post
  dbms_output.put_line('-- Them moi ' || v_object_name);
  v_script := 'procedure pr_post_' || v_object_name || '(p_refcursor   out sys_refcursor,
                           p_values       in varchar2,
                           p_err_code     out varchar2,
                           p_err_message  out varchar2);';
  dbms_output.put_line(v_script);
  dbms_output.put_line('');
  
  -- Put
  dbms_output.put_line('-- Cap nhat ' || v_object_name);
  v_script := 'procedure pr_put_' || v_object_name || '(p_refcursor   out sys_refcursor,
                          p_id           in varchar2,
                          p_values       in varchar2,
                          p_err_code     out varchar2,
                          p_err_message  out varchar2);';
  dbms_output.put_line(v_script);
  dbms_output.put_line('');
  
  -- Delete
  dbms_output.put_line('-- Xoa ' || v_object_name);
  v_script := 'procedure pr_delete_' || v_object_name || '(p_refcursor   out sys_refcursor,
                            p_id       in varchar2,
                            p_err_code     out varchar2,
                            p_err_message  out varchar2);';
  dbms_output.put_line(v_script);
  dbms_output.put_line('end;');
  -- End interface
  dbms_output.put_line('/');
  
  -- Begin body
  dbms_output.put_line('create or replace package body pks_' || v_object_name || ' is');
  dbms_output.put_line(' pkgctx plogparam.LOG_CTX;');
  dbms_output.put_line('');
  -- Get all
  dbms_output.put_line('-- Lay tat ca du lieu ' || v_object_name);
  v_script := 'procedure pr_get_' || v_object_name || 's(p_refcursor   out sys_refcursor,
                           p_err_code    out varchar2,
                           p_err_message out varchar2) as
  begin
    plog.setbeginsection(pkgctx, ' || '''pr_get_' || v_object_name || 's'');
    -- to do
    
    plog.setendsection(pkgctx, ' || '''pr_get_' || v_object_name || 's'');
  exception
    when others then
      p_err_code := ''' || -1 || ''';
      p_err_message := sqlerrm;
      plog.error(pkgctx, sqlerrm);
      plog.setendsection(pkgctx, ' || '''pr_get_' || v_object_name || 's'');
  end;';
  dbms_output.put_line(v_script);
  dbms_output.put_line('');
  
  -- Get by id
  dbms_output.put_line('-- Lay du lieu ' || v_object_name || ' theo id');
  v_script := 'procedure pr_get_' || v_object_name || '(p_refcursor   out sys_refcursor,
                          p_id          in varchar2,
                          p_err_code    out varchar2,
                          p_err_message out varchar2) as
  begin
    plog.setbeginsection(pkgctx, ' || '''pr_get_' || v_object_name || ''');
    -- to do
    
    plog.setendsection(pkgctx, ' || '''pr_get_' || v_object_name || ''');
  exception
    when others then
      p_err_code := ''' || -1 || ''';
      p_err_message := sqlerrm;
      plog.error(pkgctx, sqlerrm);
      plog.setendsection(pkgctx, ' || '''pr_get_' || v_object_name || ''');
  end;';
  dbms_output.put_line(v_script);
  dbms_output.put_line('');
  
  -- Post
  dbms_output.put_line('-- Them moi ' || v_object_name);
  v_script := 'procedure pr_post_' || v_object_name || '(p_refcursor   out sys_refcursor,
                           p_values       in varchar2,
                           p_err_code     out varchar2,
                           p_err_message  out varchar2) as
  begin
    plog.setbeginsection(pkgctx, ' || '''pr_post_' || v_object_name || ''');
    -- to do
    
    plog.setendsection(pkgctx, ' || '''pr_post_' || v_object_name || ''');
  exception
    when others then
      p_err_code := ''' || -1 || ''';
      p_err_message := sqlerrm;
      plog.error(pkgctx, sqlerrm);
      plog.setendsection(pkgctx, ' || '''pr_post_' || v_object_name || ''');
  end;';
  dbms_output.put_line(v_script);
  dbms_output.put_line('');
  
  -- Put
  dbms_output.put_line('-- Cap nhat ' || v_object_name);
  v_script := 'procedure pr_put_' || v_object_name || '(p_refcursor   out sys_refcursor,
                          p_id           in varchar2,
                          p_values       in varchar2,
                          p_err_code     out varchar2,
                          p_err_message  out varchar2) as
  begin
    plog.setbeginsection(pkgctx, ' || '''pr_put_' || v_object_name || ''');
    -- to do
    
    plog.setendsection(pkgctx, ' || '''pr_put_' || v_object_name || ''');
  exception
    when others then
      p_err_code := ''' || -1 || ''';
      p_err_message := sqlerrm;
      plog.error(pkgctx, sqlerrm);
      plog.setendsection(pkgctx, ' || '''pr_put_' || v_object_name || ''');
  end;';
  dbms_output.put_line(v_script);
  dbms_output.put_line('');
  
  -- Delete
  dbms_output.put_line('-- Xoa ' || v_object_name);
  v_script := 'procedure pr_delete_' || v_object_name || '(p_refcursor   out sys_refcursor,
                             p_id       in varchar2,
                             p_err_code     out varchar2,
                             p_err_message  out varchar2) as
  begin
    plog.setbeginsection(pkgctx, ' || '''pr_delete_' || v_object_name || ''');
    -- to do
    
    plog.setendsection(pkgctx, ' || '''pr_delete_' || v_object_name || ''');
  exception
    when others then
      p_err_code := ''' || -1 || ''';
      p_err_message := sqlerrm;
      plog.error(pkgctx, sqlerrm);
      plog.setendsection(pkgctx, ' || '''pr_delete_' || v_object_name || ''');
  end;';
  dbms_output.put_line(v_script);
  
  -- Init config log
  dbms_output.put_line('');
  dbms_output.put_line('begin');
  v_script := 'pkgctx := plog.init(''' || v_package_name || ''',
                      plevel       => 30,
                      plogtable    => TRUE,
                      palert       => TRUE,
                      ptrace       => TRUE);';
  dbms_output.put_line(v_script);
  dbms_output.put_line('end;');
  -- End body
  dbms_output.put_line('/');
end;
