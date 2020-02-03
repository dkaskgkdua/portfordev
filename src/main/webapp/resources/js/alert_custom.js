
//login need alert
// 로그인이 필요한 동작을 시행 시
function askLogin(mid)
{
	if(mid != '' && mid != null)
	{
		return true;
	}
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .login-alert').css('display', 'block');
		$('#alert-wrap .alert-box').fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			location.href = '/pro/login';
		});
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap').stop().fadeOut();
				$('#alert-wrap .login-alert').css('display', 'none');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$(window).off('keydown');
			});
		})
	})
}
// missing-alert
// 포트폴리오의 공개여부가 바뀌거나 삭제되었을 시
function askRefresh()
{
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .missing-alert').css('display', 'block');
		$('#alert-wrap .alert-box').fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			location.reload();
		});
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap').stop().fadeOut();
				$('#alert-wrap .missing-alert').css('display', 'none');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$(window).off('keydown');
				location.reload();
			});
		})
	})
}
// 본인 포트폴리오, 피드백 추천, 스크랩 시 alert
function notAllowed(msg)
{
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .not-allowed-message').text(msg);
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
		$('#alert-wrap .not-allowed-alert').css('display', 'block');
		$('#alert-wrap .alert-box').stop().fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			$('#alert-wrap .cancelBtn').trigger('click');
		});
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').fadeOut(200, function(){
				$('#alert-wrap').fadeOut();
				$('#alert-wrap .not-allowed-alert').css('display', 'none');
				$('#alert-wrap .not-allowed-message').text('');
				$('#alert-wrap .cancelBtn').css('visibility', 'visible');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$(window).off('keydown');
			});
		})
	})
}
// 에러발생 시 alert
function errorAlert(msg)
{
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .error-message').text(msg);
		$('#alert-wrap .error-alert').css('display', 'block');
		$('#alert-wrap .alert-box').stop().fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			location.reload();
		});
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').fadeOut(200, function(){
				$('#alert-wrap').fadeOut();
				$('#alert-wrap .error-alert').css('display', 'none');
				$('#alert-wrap .error-message').text('');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$(window).off('keydown');
			});
		})
	})
}
// 피드백 작성 완료 alert
function writeDoneAlert()
{
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .write-done-alert').css('display', 'block');
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
		$('#alert-wrap .alert-box').stop().fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			$('#alert-wrap .cancelBtn').trigger('click');
		});
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap').stop().fadeOut();
				$('#alert-wrap .write-done-alert').css('display', 'none');
				$('#alert-wrap .cancelBtn').css('visibility', 'visible');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$('.exit-cover').trigger('click');
				$(window).off('keydown');
			});
		})
	})
}
// 피드백 수정 확인 alert
function feedUpdateConfirm(fid){
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .feed-update-confirm').css('display', 'block');
		$('#alert-wrap .alert-box').stop().fadeIn(400, function(){
			$(window).keydown(function(key) {
				if (key.keyCode == 13) {
					$('.goBtn').trigger('click');
					$(window).off('keydown');
			    }
			});
			$('#alert-wrap .cancelBtn').on('click', function(){
				$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
					$('#alert-wrap').stop().fadeOut();
					$('#alert-wrap .feed-update-confirm').css('display', 'none');
					$('#alert-wrap .goBtn').off('click');
					$('#alert-wrap .cancelBtn').off('click');
					//$('.exit-cover').trigger('click');
					$(window).off('keydown');
				});
			})
			$('#alert-wrap .goBtn').on('click', function(){
				member_id = $('#userId').val();
				$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
					$('#alert-wrap .feed-update-confirm').css('display', 'none');
					$('#alert-wrap .goBtn').off('click');
					$('#alert-wrap .cancelBtn').off('click');
					$('.exit-cover').trigger('click');
					$(window).off('keydown');
					$('#alert-wrap').stop().fadeOut(400, function(){
						$.ajax({
							data: {'FEEDBACK_ID' : fid, 'MEMBER_ID' : member_id}, 
							type: 'POST',
							dataType: 'json', 
							async: false, 
							url: '/pro/portfolio/updateFeedback', 
							cache: false, 
							success: function(targetFeed){
								if(!targetFeed.FEEDBACK_ID){
									errorAlert('피드백 정보를 가져오는 중');
									return;
								}
								$('.feedback-update-container').addClass('updating');
								$('#update-feedback-id').val(targetFeed.FEEDBACK_ID);
								$('.feed-writer-profile-img').attr('src', targetFeed.FEED_WRITER_IMG);
								$('.feed-writer-profile-nick').text(targetFeed.FEED_WRITER);
								$('#FEED_UPDATE_CONTENT').val(targetFeed.FEEDBACK_CONTENT);
								$('.portfolio-feedback-list').css('display', 'none');
								$('.portfolio-feedback-header').css('display', 'none');
								$('.feedback-update-container').css('display', 'block');
								$('#FEED_UPDATE_CONTENT').focus();
								if($(window).height() < 740)
								{
									$('#cover-wrap').fadeIn();
									$('.exit-cover').css('bottom', '41%');
									$('#portfolio-feedback-wrap').stop().animate({top: '60%'}, 500, function(){
										$('.exit-cover').fadeIn();
									});
								}
							},
							error: function(){
								errorAlert('피드백 정보를 가져오는 중');
							}
						});
					});
				});
			});
		});
	});
}
// 피드백 수정 완료 alert
function updateDoneAlert()
{
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .update-done-alert').css('display', 'block');
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
		$('#alert-wrap .alert-box').stop().fadeIn(function(){
			$('#alert-wrap .goBtn').on('click', function(){
				$('#alert-wrap .cancelBtn').trigger('click');
			});
			$(window).keydown(function(key) {
				if (key.keyCode == 13) {
					$('.goBtn').trigger('click');
					$(window).off('keydown');
			    }
			});
			$('#alert-wrap .cancelBtn').on('click', function(){
				$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
					if($(window).height() < 740)
					{
						$('.exit-cover').fadeOut(250);
						$('#portfolio-feedback-wrap').stop().animate({top: '100%'}, 500, function(){
							$('#cover-wrap').fadeOut();
						});
					}
					$('.portfolio-feedback-list').css('display', 'block');
					$('.portfolio-feedback-header').css('display', 'block');
					$('.feedback-update-container').css('display', 'none');
					$('.feedback-update-container').removeClass('updating');
					$('#alert-wrap').stop().fadeOut();
					$('#alert-wrap .update-done-alert').css('display', 'none');
					$('#alert-wrap .cancelBtn').css('visibility', 'visible');
					$('#alert-wrap .goBtn').off('click');
					$('#alert-wrap .cancelBtn').off('click');
					//$('.exit-cover').trigger('click');
					$(window).off('keydown');
				});
			});
		});
	});
}
// 피드백 내용이 비었을 경우 alert
function feedContentNeedAlert(){
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .content-need-alert').css('display', 'block');
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
		$('#alert-wrap .alert-box').stop().fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			$('#alert-wrap .cancelBtn').trigger('click');
		});
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap').stop().fadeOut();
				$('#alert-wrap .content-need-alert').css('display', 'none');
				$('#alert-wrap .cancelBtn').css('visibility', 'visible');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$(window).off('keydown');
			});
		})
	})
}
// 피드백 삭제 확인 alert
function feedDeleteConfirm(fid){
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .feed-delete-confirm').css('display', 'block');
		$('#alert-wrap .alert-box').stop().fadeIn();
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap').stop().fadeOut();
				$('#alert-wrap .feed-delete-confirm').css('display', 'none');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$('.exit-cover').trigger('click');
				$(window).off('keydown');
			});
		})
		$('#alert-wrap .goBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap .feed-delete-confirm').css('display', 'none');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$('.exit-cover').trigger('click');
				$(window).off('keydown');
				member_id = $('#userId').val();
				$.ajax({
					data: {'FEEDBACK_ID' : fid, 'MEMBER_ID' : member_id}, 
					type: 'POST',
					async: false, 
					url: '/pro/portfolio/deleteFeedback', 
					cache: false, 
					success: function(dr){
						if(dr == 1)
						{
							$('#feedback_'+fid).remove();
							$('#best_feed_'+fid).remove();
							var feedCNT = (Number($('.portfolio-feedback-cnt').text()) - 1);
							$('.portfolio-feedback-cnt').text(feedCNT);
							if(feedCNT == '0')
							{
								if(feedPick == 'allFeed')
									$('.portfolio-feedback-list').append('<div class="no-feedback-item" style="display:block;">아직 등록된 피드백이 없습니다.</div>');
								else
									$('.portfolio-feedback-list').append('<div class="no-feedback-item" style="display:block;">아직 베스트 피드백이 없습니다.</div>');
							}
						}
						feedDeleteResult(dr);
					},
					error: function(){
						errorAlert('피드백 삭제 과정에');
					}
				});
			});
		});
	})
}
// 피드백 삭제 결과
function feedDeleteResult(result){
	var resultMsg = '';
	if(result == 0){	// 세션만료로 삭제 실패
		resultMsg = '&nbsp;실패<br>지속적인 오류 발생시 관리자에게 문의바랍니다';
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
	}
	else if(result == 1){	// 삭제 성공
		resultMsg = '&nbsp;성공';
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
	}
	else if(result == 2){	// 세션만료로 삭제 실패
		resultMsg = '&nbsp;실패<br>세션만료로 재로그인이 필요합니다.<br>로그인 페이지로 이동하시겠습니까?';
	}
	else if(result == 3){	// 삭제 권한이 없음
		resultMsg = '&nbsp;권한이 없습니다.';
		$('#alert-wrap .cancelBtn').css('visibility', 'hidden');
	}
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .delete-result-message').append(resultMsg);
		$('#alert-wrap .feed-delete-result').css('display', 'block');
		$('#alert-wrap .alert-box').stop().fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			if(result == 0){
				$('#alert-wrap .cancelBtn').trigger('click');
			}
			else if(result == 1){
				$('#alert-wrap .cancelBtn').trigger('click');
			}
			else if(result == 2){
				location.href='/pro/login';
			}
			else if(result == 3)$('#alert-wrap .cancelBtn').trigger('click');
		});
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap').stop().fadeOut();
				$('#alert-wrap .feed-delete-result').css('display', 'none');
				$('#alert-wrap .cancelBtn').css('visibility', 'visible');
				$('#alert-wrap .delete-result-message').text('');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$('.exit-cover').trigger('click');
				$(window).off('keydown');
			});
		})
	})
}
// 포트폴리오 삭제 confirm alert
function portDeleteConfirm(mid, pid){
	$('#alert-wrap').stop().fadeIn(200, function(){
		$(this).css('opacity', '1');
		$('#alert-wrap .port-delete-confirm').css('display', 'block');
		$('#alert-wrap .alert-box').fadeIn();
		$('#alert-wrap .goBtn').on('click', function(){
			location.href='/pro/portfolio/delete?MEMBER_ID='+mid+'&PORT_ID='+pid;
		});
		$(window).keydown(function(key) {
			if (key.keyCode == 13) {
				$('.goBtn').trigger('click');
				$(window).off('keydown');
		    }
		});
		$('#alert-wrap .cancelBtn').on('click', function(){
			$('#alert-wrap .alert-box').stop().fadeOut(200, function(){
				$('#alert-wrap').stop().fadeOut();
				$('#alert-wrap .port-delete-confirm').css('display', 'none');
				$('#alert-wrap .goBtn').off('click');
				$('#alert-wrap .cancelBtn').off('click');
				$(window).off('keydown');
			});
		})
	})
}
$(window).load(function(){
	
});