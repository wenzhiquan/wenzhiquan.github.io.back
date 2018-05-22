<ul class="post-copyright">
  <li class="post-copyright-author">
    <strong>{{ __('post.copyright.title') + __('symbol.colon') }} </strong>{#
  #}{{ post.title }}{#
  #}</li>
  <li class="post-copyright-author">
    <strong>{{ __('post.copyright.author') + __('symbol.colon') }} </strong>{#
  #}{{ post.author | default(config.author) }}{#
  #}</li>
  <li class="post-copyright-author">
    <strong>{{ __('post.copyright.date') + __('symbol.colon') }} </strong>{#
  #}{{ post.date | date('Y-m-d H:i:s', -480, 'CCT') =}}{#
  #}</li>
  <li class="post-copyright-author">
    <strong>{{ __('post.copyright.updated') + __('symbol.colon') }} </strong>{#
  #}{{ post.updated | date('Y-m-d H:i:s', -480, 'CCT') =}}{#
  #}</li>
  <li class="post-copyright-link">
    <strong>{{ __('post.copyright.link') + __('symbol.colon') }}</strong>
    <a href="{{ post.url | default(post.permalink) }}" title="{{ post.title }}">{{ post.url | default(post.permalink) }}</a>
    <span class="copy-path" style="margin-left: 5px;" title="点击复制文章链接"><i class="fa fa-clipboard" data-clipboard-text="{{ page.permalink }}"  aria-label="复制成功！"></i></span>
  </li>
  <li class="post-copyright-license">
    <strong>{{ __('post.copyright.license_title') + __('symbol.colon') }} </strong>
    {{ __('post.copyright.license_content', theme.post_copyright.license) }}
  </li>
</ul>
<script src="//cdn.bootcss.com/clipboard.js/1.5.10/clipboard.min.js"></script>

<!-- JS库 sweetalert 可修改路径 -->
<script src="https://cdn.bootcss.com/jquery/2.0.0/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    var clipboard = new Clipboard('.fa-clipboard');
      $(".fa-clipboard").click(function(){
      clipboard.on('success', function(){
        swal({
          title: "",
          text: '复制成功',
          icon: "success",
          showConfirmButton: true
          });
        });
    });
</script>
