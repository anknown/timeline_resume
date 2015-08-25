{include file="resume_header.tpl"}
	<body>
		<div id="header" class="container header">
			<div class="row" style="padding-bottom:30px;">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding-left:30px;">
					<h1 class="font-yahei" 
						style="display:inline;text-shadow: 1px 1px #E4E4DF;">{$Name}</h1>
					<h4 class="font-yahei" style="display:inline">{$EngName}  </h4>
					<!--
					<i class="fa fa-male fa"></i>
					-->
					<h5 class="font-yahei"> {$Sign}</h5>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="text-align:center">
					<a class="rumble" href="javascript:void(0)">
						<i class="fa fa-envelope fa-4x"></i>
						<p class="font-yahei">{$Email}</p>
					</a>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="text-align:center">
					<a class="rumble" href="javascript:void(0)">
						<i class="fa fa-phone fa-4x"></i>
						<p class="font-yahei">{$Phone}</p>
					</a>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="text-align:center">
					<a class="rumble" href="javascript:void(0)">
						<i class="fa fa-bank fa-4x"></i>
						<p class="font-yahei">{$Addr}</p>
					</a>
				</div>
			</div>
		</div>

		<div id="story" class="container" style="background-color:#484848;">
			<div class="row ">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-left" 
					style="height:30px"> </div>
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-right" 
					style="height:30px;text-align:right;padding-top:5px;">
					My Story
				</div>
			</div>

			{section name=i loop=$Story}
				{if $Story[i].type == "year"}
				<div class="row ">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-left" 
						style="height:70px"> </div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-right" 
						style="height:70px"> </div>
					<div class="col-center">
						<div class="circle-year">
							<div class="text-year">{$Story[i].year}</div>
						</div>
					</div>
				</div>
				{else if $Story[i].type == "left"}
				<div class="row ">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-left">
						<p class="font-position font-small">
							{$Story[i].year} {$Story[i].month} {$Story[i].location}
						</p>
						<p class="font-title font-medium">{$Story[i].title}</p>
						<p class="font-small">{$Story[i].desc}</p>
						<p>
							{section name=j loop=$Story[i].tags}
								<span class="label tag label-danger">{$Story[i].tags[j]}</span>
							{/section}
						</p>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-right"> </div>
					<div class="col-center">
						<div class="circle-month"></div>
					</div>
				</div>
				{else if $Story[i].type == "right"}
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-left"> </div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-right">
						<p class="font-position font-small">
							{$Story[i].year} {$Story[i].month} {$Story[i].location}
						</p>
						<p class="font-title font-medium">{$Story[i].title}</p>
						<p class="font-small">{$Story[i].desc}</p>
						<p>
							{section name=j loop=$Story[i].tags}
								<span class="label tag label-danger">{$Story[i].tags[j]}</span>
							{/section}
						</p>
					</div>
					<div class="col-center">
						<div class="circle-month"></div>
					</div>
				</div>
				{/if}
			{/section}
			</div>
			<div id="skill" class="container" style="background-color:#fafafa;
				border-left:1px solid #484848;border-right:1px solid #484848;">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 font-yahei">
						<p class="font-yahei" style="margin-bottom:15px;margin-top:5px;">
						My Skill
						</p>
						{section name=i loop=$Skill}
							<div class="skill">
								<div class="skill-left">{$Skill[i].skill}</div>
								<div class="skill-right">{$Skill[i].score}</div>
								<div style="clear:both"></div>
							</div>
						{/section}
						<div style="clear:both"></div>
						<div style="margin-bottom:5px;">
							<p class="font-yahei" style="margin-bottom:10px;margin-top:20px;">
							My Interests
							</p>
							{section name=i loop=$Interest}
								<span class="label label-default font-yahei mylabel">
									{$Interest[i]}
								</span>
							{/section}
							<p class="font-yahei" style="margin-bottom:10px;margin-top:20px;">
							My Personality
							</p>
							{section name=i loop=$Personality}
								<span class="label label-default font-yahei mylabel">
									{$Personality[i]}
								</span>
							{/section}
					</div>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 font-yahei">
					<h3 style="color:#484848">{$Summary}</h3>
					<div style="width:100%;border-bottom:1px dashed #d4d3d2"></div>
					<p style="padding-top:10px;font-weight:200">Personal Links</p>
						<ul class="links">
							{section name=i loop=$Link}
								<li><a href="#">{$Link[i]}</a></li>
							{/section}
						</ul>
				</div>
			</div>
		</div>
		<div id="footer" class="container" 
			style="border:1px solid #484848;border-top:none;background-color:#fafafa;
					border-radius:0 0 10px 10px;margin-bottom:10px;text-align:right">
			<h4 style="font-weight:300;color:#484848;font-size:13px">
				Powered By
				<a href="http://laixiabai.com/index.html">laixiabai.com</a>
			</h4>
		</div>
	</body>
</html>
<script type="text/javascript">
	$('.col-left').each(function(){
			var lh = $(this).outerHeight()
			var rh = $(this).siblings(".col-right").outerHeight()
			if(lh == 1 && rh > 1) {
				$(this).css("height", rh + "px")
				$(this).siblings(".col-right").css("height", rh + "px")
			}
			//$(this).css("height", $(this).parent().outerHeight() + "px")
	});
	$('.col-right').each(function(){
			var lh = $(this).siblings(".col-left").outerHeight()
			var rh = $(this).outerHeight()
			if(rh == 1 && lh > 1) {
				$(this).css("height", lh + "px")
				$(this).siblings(".col-left").css("height", lh + "px")
			}
			//$(this).css("height", $(this).parent().outerHeight() + "px")
	});
	$('.rumble').jrumble({
		speed: 60		
	});
	$('.rumble').hover(function(){
		$(this).trigger('startRumble');
	}, function(){
		$(this).trigger('stopRumble');
	});
</script>
