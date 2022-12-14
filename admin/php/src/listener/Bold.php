<?php

namespace nadar\quill\listener;

use nadar\quill\InlineListener;
use nadar\quill\Line;

/**
 * Convert Bold attributes into tags.
 *
 * @author Basil Suter <basil@nadar.io>
 * @since 1.0.0
 */
class Bold extends InlineListener
{
    /**
     * {@inheritDoc}
     */
    public function process(Line $line)
    {
        if ($line->getAttribute('bold')) {
            $this->updateInput($line, '<strong>'.$line->getInput().'</strong>');
        }
    }
}
