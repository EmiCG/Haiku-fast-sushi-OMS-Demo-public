<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <title> Second view </title>
    </head>

    <body>

        <?php if (isset($component)) { $__componentOriginal21c09daf47e7f7f159035bb7cbe2e828 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal21c09daf47e7f7f159035bb7cbe2e828 = $attributes; } ?>
<?php $component = App\View\Components\PanelInfo::resolve(['type' => 'rojo/azul'] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('PanelInfo'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\App\View\Components\PanelInfo::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
             <?php $__env->slot('title', null, []); ?> 
                Encabezado 1
             <?php $__env->endSlot(); ?>

             <?php $__env->slot('description', null, []); ?> 
                Esta es la descripcion del elemento 1
             <?php $__env->endSlot(); ?>
         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal21c09daf47e7f7f159035bb7cbe2e828)): ?>
<?php $attributes = $__attributesOriginal21c09daf47e7f7f159035bb7cbe2e828; ?>
<?php unset($__attributesOriginal21c09daf47e7f7f159035bb7cbe2e828); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal21c09daf47e7f7f159035bb7cbe2e828)): ?>
<?php $component = $__componentOriginal21c09daf47e7f7f159035bb7cbe2e828; ?>
<?php unset($__componentOriginal21c09daf47e7f7f159035bb7cbe2e828); ?>
<?php endif; ?>

        <?php if (isset($component)) { $__componentOriginal15951308d1f68e5fe7b360c87f6dedcc = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal15951308d1f68e5fe7b360c87f6dedcc = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.encabezado','data' => ['type' => 'gris/negro']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('encabezado'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['type' => 'gris/negro']); ?>
             <?php $__env->slot('title', null, []); ?> 
                Encabezado 2
             <?php $__env->endSlot(); ?>

             <?php $__env->slot('description', null, []); ?> 
                Esta es la descripcion del elemento 2
             <?php $__env->endSlot(); ?>
         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal15951308d1f68e5fe7b360c87f6dedcc)): ?>
<?php $attributes = $__attributesOriginal15951308d1f68e5fe7b360c87f6dedcc; ?>
<?php unset($__attributesOriginal15951308d1f68e5fe7b360c87f6dedcc); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal15951308d1f68e5fe7b360c87f6dedcc)): ?>
<?php $component = $__componentOriginal15951308d1f68e5fe7b360c87f6dedcc; ?>
<?php unset($__componentOriginal15951308d1f68e5fe7b360c87f6dedcc); ?>
<?php endif; ?>

    </body>
</html><?php /**PATH C:\xampp\htdocs\laravel\test1\resources\views/secondview.blade.php ENDPATH**/ ?>