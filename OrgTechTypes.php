<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "orgTechTypes".
 *
 * @property int $id_orgTechTypes
 * @property string $orgTechType
 */
class OrgTechTypes extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'orgTechTypes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['orgTechType'], 'required'],
            [['orgTechType'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_orgTechTypes' => 'Id Org Tech Types',
            'orgTechType' => 'Org Tech Type',
        ];
    }
}
