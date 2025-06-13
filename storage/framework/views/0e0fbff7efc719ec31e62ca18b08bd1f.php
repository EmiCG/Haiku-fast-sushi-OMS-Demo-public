<?php $attributes ??= new \Illuminate\View\ComponentAttributeBag;

$__newAttributes = [];
$__propNames = \Illuminate\View\ComponentAttributeBag::extractPropNames((['type' => 'gris/negro']));

foreach ($attributes->all() as $__key => $__value) {
    if (in_array($__key, $__propNames)) {
        $$__key = $$__key ?? $__value;
    } else {
        $__newAttributes[$__key] = $__value;
    }
}

$attributes = new \Illuminate\View\ComponentAttributeBag($__newAttributes);

unset($__propNames);
unset($__newAttributes);

foreach (array_filter((['type' => 'gris/negro']), 'is_string', ARRAY_FILTER_USE_KEY) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
}

$__defined_vars = get_defined_vars();

foreach ($attributes->all() as $__key => $__value) {
    if (array_key_exists($__key, $__defined_vars)) unset($$__key);
}

unset($__defined_vars); ?>

<?php
    
    switch ($type) {
        case 'gris/negro':
           
            $classTitle = 'text-gray-900';
            $classDescription = 'text-gray-500';
            break;

        case 'rojo/azul':
    
            $classTitle = 'text-red-900';
            $classDescription = 'text-blue-500';
            break;
        
        case 'verde/naranja':
               
            $classTitle = 'text-green-900';
            $classDescription = 'text-orange-500';
                break;
        default:

            $classTitle = 'text-gray-900';
            $classDescription = 'text-gray-500';
            break;
    }

?>

<div>
    <div class="px-4 sm:px-0 mb-5">
      <h3 class="text-base/7 font-semibold <?php echo e($classTitle); ?>"><?php echo e($title ?? 'error en el titulo'); ?></h3>
      <p class="mt-1 max-w-2xl text-sm/6 <?php echo e($classDescription); ?>"><?php echo e($description ?? 'error en la descripcion'); ?></p>
    </div>
</div><?php /**PATH C:\xampp\htdocs\laravel\test1\resources\views/components/encabezado.blade.php ENDPATH**/ ?>