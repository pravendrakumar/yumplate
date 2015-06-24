<div class="container">
                <div class="row">
                    <div class="col-sm-8">
                        <h4>Company</h4>
                        <ul class="footerNav">
                            <li>
                            <?php 
                            echo $this->Html->link('Our Story',
                            array(
                            'controller' => 'stories',
                            'action' => 'view',
                            'full_base' => true
                            )
                            );
                            ?>
                            </li>
                            <li>|</li>
                            <li>
                            <?php 
                            echo $this->Html->link(
                            'How it Works',
                            array(
                            'controller' => 'products',
                            'action' => 'howitworks',
                            'full_base' => true
                            )
                            );
                            ?></li>
                            <li>|</li>
                            <li>
                            <?php 
                            echo $this->Html->link(
                            'Contact',
                            array(
                            'controller' => 'products',
                            'action' => 'contact',
                            'full_base' => true
                            )
                            );
                            ?>
                              
                            </li>
                            <li>|</li>
                            <li>
                            <?php 
                            echo $this->Html->link(
                            'Help',
                            array(
                            'controller' => 'products',
                            'action' => 'help',
                            'full_base' => true
                            )
                            );
                            ?>
                             </li>                            
                        </ul>
                        <ul class="footerNav">
                            <li>
                            <?php 
                            echo $this->Html->link(
                            'Privacy Policy',
                            array(
                            'controller' => 'products',
                            'action' => 'privacypolicy',
                            'full_base' => true
                            )
                            );
                            ?>  
                             </li>
                            <li>|</li>
                            <li>
                            <?php 
                            echo $this->Html->link(
                            'Term & Conditions',
                            '/products/term_and_conditions'
                            );
                            ?>    
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-4 text-center">
                        <h4 class="text-center">Social</h4>
                        <ul class="social-icons text-center">
                            <li>
                                <a  href="https://www.facebook.com/yumplate" target="_blank" class="icon1" ></a>
                            </li>
                            <!--li>
                                <a  href="#" class="icon2"></a>
                            </li-->
                            <li>
                                <a  href="https://instagram.com/yumplate" target="_blank" class="icon3"></a>
                            </li>
                            <li>
                                <a  href="https://twitter.com/yum-platelinks" target="_blank" class="icon4" ></a>
                            </li>
                            <!--li>
                                <a  href="#" class="icon5" ></a>
                            </li>
                            <li>
                                <a  href="#" class="icon6" ></a>
                            </li-->
                        </ul>
                    </div>
                </div>
            </div>