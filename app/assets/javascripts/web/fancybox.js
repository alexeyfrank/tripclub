jQuery(function() {
	jQuery("a[class*=fancybox]").fancybox({
		'overlayOpacity'	:	0.7,
		'overlayColor'		:	'#000000',
		'transitionIn'		: 'elastic',
		'transitionOut'		: 'elastic',
		'easingIn'      	: 'easeOutBack',
		'easingOut'     	: 'easeInBack',
		'speedIn' 			: '700',
		'centerOnScroll'	: true,
		'onComplete'		: function( currentArray, currentIndex, currentOpts ) {
			if ( currentOpts.type == 'image' ) return;

			var $this_frame 	= jQuery( '#fancybox-wrap' ).find( 'iframe' ),
				this_frame_src 	= $this_frame.attr( 'src' );

			$this_frame.data( 'et_video_embed', $this_frame.attr( 'src' ) );

			// if we removed autoplay previously, let's add it back
			if ( jQuery( currentOpts.href ).find( 'iframe' ).hasClass( 'et_autoplay_removed' ) )
				$this_frame.attr( 'src', this_frame_src + '&autoplay=1' );
		},
		'onClosed'			: function( currentArray, currentIndex, currentOpts ) {
			if ( currentOpts.type == 'image' ) return;

			var $this_frame = jQuery( currentOpts.href ).find( 'iframe.et_autoplay_removed' ),
				this_frame_src,
				$frame = jQuery( currentOpts.href ).find( 'iframe' );

			$frame.attr( 'src', $frame.data( 'et_video_embed' ) )

			if ( $this_frame.length ) {
				// delete autoplay after closing the fancybox window to prevent videos from playing in background
				frame_src = $this_frame.attr( 'src' ).replace( /autoplay=1/g, '' );
				$this_frame
					.attr( 'src', '' )
					.attr( 'src', frame_src );
			}
		}
	});
});
