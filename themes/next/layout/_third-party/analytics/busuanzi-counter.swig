{% if theme.busuanzi_count.enable %}
<div class="busuanzi-count">
  <script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>

  {% if theme.busuanzi_count.total_visitors %}
    <span class="site-uv" title="{{ __('footer.total_visitors') }}">
      <i class="fa fa-{{ theme.busuanzi_count.total_visitors_icon }}"></i>
      本站访客数： <span class="busuanzi-value" id="busuanzi_value_site_uv"></span> 人
    </span>
  {% endif %}

  {% if theme.busuanzi_count.total_views %}
    <span class="site-pv" title="{{ __('footer.total_views') }}">
      <i class="fa fa-{{ theme.busuanzi_count.total_views_icon }}"></i>
      本站总访问量： <span class="busuanzi-value" id="busuanzi_value_site_pv"></span> 次
    </span>
  {% endif %}
</div>
{% endif %}
