$(function(){
            //for the data-jAlerts
            $.jAlert('attach');

            $.alertOnClick('.onOpen', {
                'title':'On Open',
                'content':'Do it!',
                'onOpen': function(){
                    alert('Hi!');
                }
            });

            $.alertOnClick('.onClose', {
                'title':'On Close',
                'content':'Close to show popup',
                'onClose': function(){
                    alert('Hi!');
                }
            });

            $.alertOnClick('.openClose', {
               'title':'Gonna close',
                'content':'This will close after 2 seconds',
                'onOpen': function(alert){
                    window.setTimeout(function(){
                        alert.closeAlert();
                    }, 2000);
                }
            });

            $.alertOnClick('.getTopClose', {
                'title':'Gonna close',
                'content':'This will close after 2 seconds',
                'onOpen': function(alert){
                    window.setTimeout(function(){
                        $.jAlert('current').closeAlert();
                    }, 2000);
                }
            });
		});