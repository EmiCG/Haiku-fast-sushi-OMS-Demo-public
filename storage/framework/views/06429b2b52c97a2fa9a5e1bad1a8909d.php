<?php if (isset($component)) { $__componentOriginal4619374cef299e94fd7263111d0abc69 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal4619374cef299e94fd7263111d0abc69 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.app-layout','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('app-layout'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
     <?php $__env->slot('layoutTitle', null, []); ?> 
        MENU
     <?php $__env->endSlot(); ?>

     <?php $__env->slot('slot', null, []); ?> 

        <div class="absolute top-4 right-4">
            <a href="/laravel/test1/public/admin/productos/create" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
               Crear producto
            </a>
        </div>

        <?php $__currentLoopData = $productos; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $producto): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

            <div class="flex flex-col items-center justify-center bg-gray-100 p-4 rounded-lg shadow-md m-4">
                <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow">
                    <h1 class="text-2xl font-bold text-gray-800" name='nombre'><?php echo e($producto->nombre); ?></h1>
                    <h2 class="text-lg font-semibold text-green-600 mt-2" name='precio'><?php echo e($producto->precio); ?></h2>
                    <p class="text-gray-600 mt-2" name='descripcion'><?php echo e($producto->descripcion); ?></p>
                    <h2 class="text-xl font-medium text-gray-700 mt-4">Imagen</h2><br><br>
                    <a href="/laravel/test1/public/admin/productos/edit/<?php echo e($producto->id); ?>" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded mt-10">
                        Editar producto
                    </a>
                    
                    <form action="/laravel/test1/public/admin/productos/delete/<?php echo e($producto->id); ?>" method="POST">
                        <?php echo csrf_field(); ?>
                        <?php echo method_field('DELETE'); ?>
                        
                        <button type="submit" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded mt-10">
                        Eliminar producto
                        </button>
                    </form>
                </div>
            </div>
                
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

     <?php $__env->endSlot(); ?>

 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal4619374cef299e94fd7263111d0abc69)): ?>
<?php $attributes = $__attributesOriginal4619374cef299e94fd7263111d0abc69; ?>
<?php unset($__attributesOriginal4619374cef299e94fd7263111d0abc69); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal4619374cef299e94fd7263111d0abc69)): ?>
<?php $component = $__componentOriginal4619374cef299e94fd7263111d0abc69; ?>
<?php unset($__componentOriginal4619374cef299e94fd7263111d0abc69); ?>
<?php endif; ?><?php /**PATH C:\xampp\htdocs\laravel\test1\resources\views/admin-view.blade.php ENDPATH**/ ?>