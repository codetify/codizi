<?php

$alert = $this->session->userdata("alert");

if($alert){
    
if($alert["type"] === "success"){ ?>

    <script>
        sweetAlert({
			type:'success',
            title:'<?php echo $alert["title"]; ?>',
            text:'<?php echo $alert["text"]; ?>',
            position:'topCenter' 
        })
    </script>

<?php } else { ?>

    <script>
        sweetAlert({
			type:'<?php echo $alert["type"]; ?>',
            title:'<?php echo $alert["title"]; ?>',
            text:'<?php echo $alert["text"]; ?>',
            position:'topCenter' 
        })
    </script>

<?php } } ?>