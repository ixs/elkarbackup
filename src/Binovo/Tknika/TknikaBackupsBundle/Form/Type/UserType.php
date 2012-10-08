<?php

namespace Binovo\Tknika\TknikaBackupsBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $t = $options['translator'];
        $builder->add('username'    , 'text'    , array('label' => $t->trans('Name'     , array(), 'BinovoTknikaBackups')))
                ->add('newPassword' , 'password', array('label' => $t->trans('Password' , array(), 'BinovoTknikaBackups')))
                ->add('email'       , 'email'   , array('label' => $t->trans('Email'    , array(), 'BinovoTknikaBackups')))
                ->add('isActive'    , 'checkbox', array('label' => $t->trans('Is active', array(), 'BinovoTknikaBackups'),
                                                          'required' => false));
    }

    public function getDefaultOptions(array $options)
    {
        return array(
            'data_class' => 'Binovo\Tknika\TknikaBackupsBundle\Entity\User',
            'translator' => null,
        );
    }

    public function getName()
    {
        return 'User';
    }
}